pkgname=fswm
pkgver=0
pkgrel=0
pkgdesc="Feature-complete and portable full screen window manager based on libxcb and 221 lines of C89."
url="https://github.com/pbizopoulos/fswm"
arch=('any')
license=('MIT')
depends=('xcb-util-keysyms')
source=("${url}/tarball/main")
sha256sums=('f4f6329e3fc915eeeafdf06172272a34cc4c23f9581d541cddc15e1c715dd310')

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
