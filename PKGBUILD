pkgname=mariebuild
pkgver=0.6.2
pkgrel=1
pkgdesc="A simple build system with support for incremental builds"
arch=('x86_64')
url="https://github.com/FelixEcker/mariebuild"
license=('BSD-3')
depends=('clang' 'glibc>=2.39')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bc50e8df7950680e7d8609f8006dc481c47395947abe57bd3fa641027f26b3df')

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
