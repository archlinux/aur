# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-userinfo-module
pkgver=1.3.6
pkgrel=1
pkgdesc="gtklock module adding user info to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-userinfo-module"
license=('GPL3')
depends=(gtk3 accountsservice gtklock)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b4fd843499473e57f3029af503ce39187de45ccfe5dc21f58ffe9dba17704e94')
LDFLAGS="${LDFLAGS/--as-needed/--no-as-needed}"

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
