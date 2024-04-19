# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-userinfo-module
pkgver=3.0.0
pkgrel=1
pkgdesc="gtklock module adding user info to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-userinfo-module"
license=('GPL3')
depends=(gtk3 accountsservice gtklock)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('51c21cf90a5c830e8ba095e02734d2da512609ed47bc377abf45f100a9571fd1')
LDFLAGS="${LDFLAGS/--as-needed/--no-as-needed}"

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
