#Maintainer: Karl Wikström <boogrocha@sidus.io>
#Maintainer: William Leven <boogrocha@sidus.io>

pkgname=boogrocha
pkgver=r43.6342c69
pkgrel=1
pkgdesc="A lightweight, easy to use application for managing your group room bookings at Chalmers University of Technology"
arch=('x86_64')
url="https://github.com/sidusio/boogrocha"
license=("GPL3")
makedepends=(git go)
source=($pkgname-$pkgver::git+$url.git)
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$pkgname-$pkgver
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$pkgname-$pkgver/cmd/bgc
	go build
}

package() {
	install -Dm755 $srcdir/$pkgname-$pkgver/cmd/bgc/bgc "$pkgdir"/usr/bin/$pkgname/bgc
}
