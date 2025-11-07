# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=eycorsican
_pkgname=leaf
pkgname=${_pkgname}-bin
pkgver=0.12.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A versatile and efficient proxy framework with nice features suitable for various use cases"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-musl.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-musl.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            'bd13c9c0d3fa1278c4638ae50858a8fe8820db2515924e1c73bf361abac6af92')
sha256sums_x86_64=('9dad521bd3af199349920c7c95a8e68ae9d519a0652a85b4a345dcbf271ac13e')
sha256sums_aarch64=('beaa4aacd2417b2fd8daadb15dedbeb07476b72c4f30f9db8bf52f3e04ef172a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
