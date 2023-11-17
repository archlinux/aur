pkgname=fswm
pkgver=0
pkgrel=0
pkgdesc="Feature-complete and portable full screen window manager based on libxcb and 221 lines of C89."
url="https://github.com/pbizopoulos/fswm"
arch=('any')
license=('MIT')
depends=('xcb-util-keysyms')
source=("${url}/tarball/main")
sha256sums=('4782448554672608a112dc9e14c8fb653dc95bb54a9b88e423c9cc9a0aa5e5d9')

build() {
	cd pbizopoulos-fswm-*/
	make
}

package() {
	cd pbizopoulos-fswm-*/
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
