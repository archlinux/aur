pkgname="i3lock-color"
pkgver=2.9.1
pkgrel=2
pkgdesc="An improved screenlocker based upon XCB and PAM with color configuration support"
arch=('i686' 'x86_64')
url="https://github.com/chrjguill/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'xcb-util-keysyms' 'pam' 'libev' 'cairo' 'libxkbcommon-x11')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock')
source=("https://github.com/chrjguill/i3lock-color/archive/2.9.1-c.tar.gz")
md5sums=('SKIP')
_version="2.9.1-c"

build() {
	cd "${srcdir}/${pkgname}-${_version}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${_version}"
	make DESTDIR="$pkgdir" install
	install -Dm644 i3lock.1 ${pkgdir}/usr/share/man/man1/i3lock.1
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
