pkgname=mariebuild
pkgver=0.6.0r2
pkgrel=1
pkgdesc="A simple build system with support for incremental builds"
arch=('x86_64')
url="https://github.com/FelixEcker/mariebuild"
license=('BSD-3')
depends=('clang' 'glibc>=2.39')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bef356e41732250e34a35ffd77b341d9782a5d9b72e7645f8a938fb7521976fa')

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
