pkgname=mariebuild
pkgver=0.7.2r2
pkgrel=1
pkgdesc="A simple build system with support for incremental builds"
arch=('x86_64')
url="https://github.com/FelixEcker/mariebuild"
license=('BSD-3')
depends=('clang' 'glibc>=2.39')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('83afda07a27fbeedbf3a2c2d415db390bd749827d8f912e0b82fda6c5cd6ea26')

build() {
	cd "$pkgname-$pkgver"
        bash setup.bash
        bash build.bash --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 ./build/release/mb -t "$pkgdir/usr/bin/"
}
