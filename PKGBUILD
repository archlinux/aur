# Maintainer: Atnanasi <ys2000pro@gmail.com>
pkgname=cuishark
pkgver=0.1.2
pkgrel=1
pkgdesc="A protocol analyzer like a wireshark on CUI/TUI"
arch=('i686' 'x86_64')
url="https://github.com/slankdev/cuishark"
license=('MIT')
depends=(libpcap ncurses)
makedepends=(git)
conflicts=()

source=("https://github.com/slankdev/cuishark/archive/v$pkgver.tar.gz")
sha256sums=('40e2eb847a79d2b91c6f504e948e8432ee42e8401e4854a5ec9439acf379d07b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
