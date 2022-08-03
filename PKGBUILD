# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-userinfo-module
pkgver=1.3.4
pkgrel=1
pkgdesc="gtklock module adding user info to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-userinfo-module"
license=('GPL3')
depends=(gtk3 accountsservice gtklock=$pkgver)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1721649441a7ed15eb3b9d22b793392c644d0ddd50002c51c8e76739dfe45b5e')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
