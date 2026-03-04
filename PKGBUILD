# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Vnilabean
_pkgname=ferris-scan
pkgname=${_pkgname}-bin
pkgdesc="Lightweight and simple Rust based file scanner"

pkgver=0.25
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}"{-tui,-gui})
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.MD")
source_x86_64=("${_pkgname}-tui-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-tui-${_pkgvername}-linux"
							 "${_pkgname}-gui-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-gui-${_pkgvername}-linux")
sha256sums=('d82b78d7da087d42ab7fe4ff143f3699e760e44802b10b3da032e6b18943289b')
sha256sums_x86_64=('042f87347fcea75dfa7ace17a92f4f242df5c971f63cb95ab778280238585aa8'
                   'daf760b2b271f654a76dae5cadeb50277ab7484d09bf27136a8afe07fe83b2b9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-tui-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}-tui"
	install -Dm755 "${_pkgname}-gui-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}-gui"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
