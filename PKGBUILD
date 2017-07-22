# Maintainer: Atnanasi <ys2000pro@gmail.com>
pkgname=cuishark
pkgver=0.1
pkgrel=1
pkgdesc="A protocol analyzer like a wireshark on CUI/TUI"
arch=('i686' 'x86_64')
url="https://github.com/slankdev/cuishark"
license=('MIT')
depends=(libpcap ncurses)
makedepends=(git)
conflicts=()

source=("https://github.com/slankdev/cuishark/archive/v$pkgver.tar.gz")
md5sums=("164db918e9e0c5c2a4252824c93c582b")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
