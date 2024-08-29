#Maintainer: Maxb0tbeep <max@polygonal.place)
pkgname=projman
pkgver=1.1.1
pkgrel=1
pkgdesc="A project manager CLI tool for organization and convenience"
arch=(x86_64)
url="https://gitlab.com/Maxb0tbeep/projman"
license=('GPLv3')
makedepends=(nim git)
provides=(projman)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=(SKIP)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	nimble build -d:release -y
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/${pkgname}"
}
