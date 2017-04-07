pkgname=ftree
pkgver=0.2.0
pkgrel=2
pkgdesc='Convert lists of files into tree(1)-like output'
url="https://github.com/thoughtbot/$pkgname"
arch=(i686 x86_64)
license=(MIT)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/thoughtbot/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('eb182e84e169783b26079396bdb25da2')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's|"github.com/calebthompson/ftree/tree"|"./tree"|' main.go
	go build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
	#install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
