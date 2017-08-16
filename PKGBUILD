pkgname=whatsapp-purple-git
pkgver=v0.8.3.r73.07ed931
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
pkgrel=1
pkgdesc="WhatsApp protocol implementation for libpurple (Pidgin)"
arch=(i686 x86_64)
url="https://github.com/davidgfnet/whatsapp-purple"
license=('GPL')
depends=('libpurple' 'freeimage')
source=("git+https://github.com/davidgfnet/whatsapp-purple.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
