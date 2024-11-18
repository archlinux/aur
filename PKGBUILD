pkgname=mariebuild
pkgver=0.6.3
pkgrel=1
pkgdesc="A simple build system with support for incremental builds"
arch=('x86_64')
url="https://github.com/FelixEcker/mariebuild"
license=('BSD-3')
depends=('clang' 'glibc>=2.39')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7f7042a971625acf76c9bd2788e1b78bca0f305cd11abeca3eb5021ae0b0bc8b')

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
