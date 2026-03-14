# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abhixdd
_pkgname=ghgrab
pkgname=${_pkgname}-bin
pkgdesc="A simple, pretty terminal tool that lets you search and download files from GitHub without leaving your CLI"

pkgver=1.0.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('b86c9152470bd58a9b37cbd1134ca83063725cf264ed2cbc254f7d17fdc6db07'
            '2447d1e56a881a12855aa080ed2fcb491b5c23a4dfb72a90c5e591df811615b0')
sha256sums_x86_64=('0a8032e0dfe02e59ef207721b184f3730b624036e699936305dbc34e480aa03c')
sha256sums_aarch64=('4c504d0663e6ffbbec3bdff8cd7840a7c1298ee4775172d43787dab86498617a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
