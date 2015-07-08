# Contributor: Biell <biell@pobox.com>
pkgname=gkrellsun
pkgver=1.0.0
pkgrel=2
pkgdesc="GKrellSun plugin for gkrellm2 to show sunrise and sunset"
url="http://gkrellsun.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gkrellm' 'gtk2')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname%20gkrellm-2.2/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('fbbf5c23a3966b2e16a2bab19a0885b7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	/bin/install -D -m755 src20/$pkgname.so \
		$pkgdir/usr/lib/gkrellm2/plugins/$pkgname.so
}
