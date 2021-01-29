# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=librnd-git
pkgver=r137.95e7634
pkgrel=1
epoch=
pkgdesc="A compact suite of C libraries for various tasks"
arch=('x86_64')
url="https://github.com/randoragon/rnd-libs"
license=('MIT')
depends=()
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd rnd-libs
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd rnd-libs
	make
}

package() {
	cd rnd-libs
	make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

