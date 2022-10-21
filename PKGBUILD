# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-userinfo-module
pkgver=2.0.0
pkgrel=1
pkgdesc="gtklock module adding user info to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-userinfo-module"
license=('GPL3')
depends=(gtk3 accountsservice gtklock)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52f794cac1bf1a50746bb8c4cead55e249a5b8dcd245ef2279212debe8c6fa07')
LDFLAGS="${LDFLAGS/--as-needed/--no-as-needed}"

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
