# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-playerctl-module
pkgver=3.0.0
pkgrel=1
pkgdesc="gtklock module adding media player controls to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-playerctl-module"
license=('GPL3')
depends=(gtk3 playerctl libsoup gtklock)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46ea6b024761ad4a5f273bb524b00acc81178b5280f2967dc4c54b7e26b613b0')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
