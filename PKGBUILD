pkgname=fswm
pkgver=0
pkgrel=0
pkgdesc="Feature-complete and portable full screen window manager based on XCB and 221 lines of C89."
url="https://github.com/pbizopoulos/fswm"
arch=('any')
license=('MIT')
depends=('xcb-util-keysyms')
source=("${url}/tarball/main")
sha256sums=('87f1b62246a7c9bd3cb97f5d1f9d0618054ac8624203bcd4a0d92914654aa292')

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
