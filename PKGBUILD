pkgname=fswm
pkgver=0
pkgrel=0
pkgdesc="Feature-complete and portable full screen window manager based on libxcb and 221 lines of C89."
url="https://github.com/pbizopoulos/fswm"
arch=('any')
license=('MIT')
depends=('xcb-util-keysyms')
source=("${url}/tarball/main")
sha256sums=('d9af21508113038827352f1af9d4b22129aac28defe6f19520c7dbce6ea4662e')

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
