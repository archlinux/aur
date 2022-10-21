# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-powerbar-module
pkgver=2.0.0
pkgrel=1
pkgdesc="gtklock module adding power controls to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-powerbar-module"
license=('GPL3')
depends=(gtk3 gtklock)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c3730800011e0971924b1f21c4ac6f6bfd3d2e2cf72edf97e75ab1a33944bb6')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
