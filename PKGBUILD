pkgname=mariebuild
pkgver=0.5.3
pkgrel=1
pkgdesc="A simple build system with support for incremental builds"
arch=('x86_64')
url="https://github.com/FelixEcker/mariebuild"
license=('BSD-3')
depends=('clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1652d0e3488a4ed86dae32ff6ca6d25a5ba14b0487a6c14aefb3a198db30a335')

build() {
	cd "$pkgname-$pkgver"
        bash setup.bash
        bash build.bash
        ./mb -t release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 ./mb -t "$pkgdir/usr/bin/"
}
