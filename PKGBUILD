pkgname=fswm
pkgver=0
pkgrel=0
pkgdesc="fswm is a feature-complete and portable full screen window manager based on libxcb and 221 lines of C89."
url="https://github.com/pbizopoulos/fswm"
arch=('any')
license=('MIT')
depends=('xcb-util-keysyms')
source=("${url}/tarball/main")
sha256sums=('107cc9ee174392d1cb864a9a20f6c93dd91f12452f75608c355e24f95a785681')

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
