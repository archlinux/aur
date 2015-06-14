# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=gnomato
pkgver=1.0.2
pkgrel=1
pkgdesc="A timer for Pomodoro Technique"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/gnomato/"
license=('GPL3')
depends=('gtkmm3' 'libnotify')
makedepends=('intltool' 'gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/diegorubin/gnomato/archive/${pkgver}.tar.gz")
md5sums=('a54ef44c6204fdbe6c1c690dbcde0211')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	autoreconf -vi
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
