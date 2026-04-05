# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=dredge
_pkgauthor=DeprecatedLuar
_pkgname=dredge-cargo
pkgname=${_appname}-bin
pkgdesc="Backed-up personal encrypted vault for the terminal"

pkgver=0.9.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}" "${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}_${_barch[1]}")
sha256sums=('fca05920ea4892c3176c4219b75ca6f29e2cfdcfa5568075b42e2244c338705f'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e')
sha256sums_x86_64=('7edd4fd5928ba776c89c421769ecfb37ff40e01a35eef202a6facab64f3f2e0b')
sha256sums_aarch64=('1ee9c3facf36ca6abd2da367891ff3b4ae47cde8fba74ef5bf512a339e272d53')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
