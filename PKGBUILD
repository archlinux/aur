# Maintainer: BlitDev <blitdevan@proton.me>
pkgname=dismember
pkgver=0.0.1
pkgrel=1
pkgdesc="Scan memory for secrets and more. Maybe eventually a full /proc toolkit."
url="https://github.com/liamg/dismember"
arch=("x86_64")
license=("MIT")
makedepends=("go")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
#options=(!strip)
sha256sums=('7f78d5f986b97ee81f7b74f678e7bd6e4c48e83057778ee6d6e09d154ce5a45d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build
}

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

