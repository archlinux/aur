# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=groffhl-git
pkgver=1.0.r4.1f52438
pkgrel=1
epoch=
pkgdesc="groff syntax highlighting parser"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/randoragon/groffhl"
license=('MIT')
depends=()
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')
provides=('groffhl')

pkgver() {
    cd groffhl
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd groffhl
	make
}

package() {
	cd groffhl
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

