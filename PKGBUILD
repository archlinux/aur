# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-userinfo-module
pkgver=1.3.5
pkgrel=2
pkgdesc="gtklock module adding user info to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-userinfo-module"
license=('GPL3')
depends=(gtk3 accountsservice "gtklock>=$pkgver")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('100c98dd7b1c9526d29251eb031e4ebc2a890cfbb7cace445c199b337b27889a')
LDFLAGS="${LDFLAGS/--as-needed/--no-as-needed}"

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
