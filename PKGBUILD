# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=saul
_pkgauthor=DeprecatedLuar
_pkgname=better-curl-saul
pkgname=${_appname}-bin
pkgdesc="Better Curl Saul is a homemade CLI 'http client' to make api reusability simple"

pkgver=0.3.4
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENCE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}")
sha256sums=('358c1d2c06c004b90753d525e101f3f67dfbba09c7a6d603edb54155f0e09941'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e')
sha256sums_x86_64=('7621d552cacc8bd6831dc8b81d8c56e4961c44d5d32831f15b8e19fa863445ef')
sha256sums_aarch64=('181790b1a0305d12808ae5479ed24573aa05a1f0f3747a8efae9eac470a7f491')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
