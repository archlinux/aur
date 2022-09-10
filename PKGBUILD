# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-powerbar-module
pkgver=1.3.6
pkgrel=3
pkgdesc="gtklock module adding power controls to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-powerbar-module"
license=('GPL3')
depends=(gtk3 gtklock)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('282820bbec4586c2dbdde295c4d6d37c3dc7d3a327ba85c9d37a33fb82d7b5b6')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
