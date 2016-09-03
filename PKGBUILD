pkgname=polkit-pkla-compat
pkgver=0.1
pkgrel=1
pkgdesc="Rules for polkit to add compatibility with pklocalauthority"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/$pkgname/"
license=('LGPL')
depends=('polkit>=0.106')
makedepends=('docbook-xsl' 'libxslt')
source=("https://fedorahosted.org/releases/p/o/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('54ac39680327d65ceafa583480ba6d98')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr        \
	            --localstatedir=/var \
	            --sysconfdir=/etc
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
