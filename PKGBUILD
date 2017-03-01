# Maintainer: Nahuel Alonso <blizzard.nna@gmail.com>
pkgname=webmc
pkgver="0.5"
pkgrel=5
pkgdesc="ffmpeg gtk client for quick webms convertions"
arch=(x86_64)
url="https://github.com/nahwar/webmc"
license=('GPL')
depends=(ffmpeg xterm gtkmm3)
makedepends=(coreutils git)
source=(git+"https://github.com/nahwar/webmc.git")
md5sums=('SKIP')

build() {
	cd $srcdir/webmc
	g++ simple.cc -o webmc64 `pkg-config gtkmm-3.0 --libs --cflags`
}
package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/webmc/webmc" "$pkgdir/usr/bin/webmc"
	install -Dm755 "$srcdir/webmc/webmc64" "$pkgdir/opt/$pkgname/"
	install -Dm755 "$srcdir/webmc/glade.glade" "$pkgdir/opt/$pkgname/"
	
}
