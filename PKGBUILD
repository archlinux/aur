# Maintainer: El Bachir <bachiralfa@gmail.com>
pkgname=gt
pkgver=1.4.3
pkgrel=1
pkgdesc="A tree-like command-line tool written in Go"
arch=('x86_64')
url="https://github.com/elbachir-one/gt"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbachir-one/gt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33de9e42658c50eb639f8a6848ad89cb279d3fc35286c639b44b8b665c8d6f17')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export GOPATH="$srcdir/go"
	export GO111MODULE=on
	go build -o gt
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 gt "$pkgdir/usr/bin/gt"
	install -Dm644 gt.1 "$pkgdir"/usr/share/man/man1/gt.1
}
