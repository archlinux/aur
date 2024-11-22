#Maintainer: Maxb0tbeep <max@polygonal.place)
pkgname=bestfetch
pkgver=1.1.0
pkgrel=1
pkgdesc="the best system fetch ever, powered by nim"
arch=(x86_64)
url="https://gitlab.com/Maxb0tbeep/bestfetch"
license=('GPLv3')
makedepends=(nim git)
provides=(bestfetch)
conflicts=(bestfetch-git)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=(SKIP)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	nimble build -d:release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/${pkgname}"
}
