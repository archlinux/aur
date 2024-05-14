pkgname=mariebuild
pkgver=0.5.2
pkgrel=1
pkgdesc="A simple build system with support for incremental builds"
arch=('x86_64')
url="https://github.com/FelixEcker/mariebuild"
license=('BSD-3')
depends=('clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('08068595b27c4d2475685911d5857c0b649958527eb882b8e27105c1c537c69e')

build() {
	cd "$pkgname-$pkgver"
        bash setup.bash
        bash build.bash
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 ./mb -t "$pkgdir/usr/bin/"
}
