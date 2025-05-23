# Maintainer: Jim Philip <jimphilip394 at gmail dot com>

pkgname=shit
pkgver=1.0
pkgrel=1
pkgdesc="Simple file server in Go"
arch=('x86_64')
url="https://github.com/notwithering/shit"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e7ef7856c622703e156d2e7609ffeaa21443566b087fa43684e510e486e3e608')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -trimpath -o "$pkgname"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
