pkgname=mariebuild
pkgver=0.7.1
pkgrel=1
pkgdesc="A simple build system with support for incremental builds"
arch=('x86_64')
url="https://github.com/FelixEcker/mariebuild"
license=('BSD-3')
depends=('clang' 'glibc>=2.39')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('373b201bcd55d81a34beda6d20ac331ab2aa691dfe993a16045101e16fa8c8f3')

build() {
	cd "$pkgname-$pkgver"
        bash setup.bash
        bash build.bash --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 ./mb -t "$pkgdir/usr/bin/"
}
