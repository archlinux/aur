pkgname=phodav
pkgver=2.2
pkgrel=1
pkgdesc="A WebDav server implementation using libsoup (RFC 4918)"
arch=('i686' 'x86_64')
url="http://wiki.gnome.org/$pkgname"
license=('LGPL')
depends=('libsoup')
makedepends=('asciidoc' 'intltool' 'xmlto')
source=("http://download.gnome.org/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('18dc8890ef3606f2a053054658dbf016')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
	            --sbindir=/usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	install -D -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim: set ft=sh ts=4 sw=4 noet:
