# Maintainer:  gls < ghoslovescorebg at gmail dot com >

pkgname=zephyr
pkgver=3.1.2
pkgrel=3
pkgdesc="An enterprise-scale, distributed real-time messaging and notification system"
arch=('i686' 'x86_64')
url="http://zephyr.1ts.org/"
license=('custom')
depends=('e2fsprogs' 'libx11' 'c-ares')
options=('!libtool')
source=("https://github.com/$pkgname-im/$pkgname/archive/release/$pkgver.tar.gz")
md5sums=('858a6c01a8bcb9aec92eaf163f06d266')
sha1sums=('ad6fd11c81e2422696c46153dc1a63e5f8c0eb72')
sha256sums=('741fb62b1a8bcd3642b164ec1da2d725b6da6313e38b0eed55e03101bccc3e0c')

build() {

	cd "$srcdir/$pkgname-release-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
	make

}

package() {

	cd "$srcdir/$pkgname-release-$pkgver"
	make DESTDIR="$pkgdir" install
	install -D -m755 "h/zephyr/mit-copyright.h"  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
