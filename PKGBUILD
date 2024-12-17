pkgname=mariebuild
pkgver=0.7.0
pkgrel=1
pkgdesc="A simple build system with support for incremental builds"
arch=('x86_64')
url="https://github.com/FelixEcker/mariebuild"
license=('BSD-3')
depends=('clang' 'glibc>=2.39')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('196789976cc220b187fc1f0d17cc8fa43a439cd4959d8116557aac342cd7821b')

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
