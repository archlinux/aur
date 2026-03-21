pkgname=systats
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple ncurses-based system monitor"
arch=('x86_64')
url="https://github.com/travisschaffrick/systats"
license=('MIT')
depends=('ncurses')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a562872f01d5a4f46a0f60686dfee0040648d90197c42548652ccc2fb91c1d41')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 systats "$pkgdir/usr/bin/systats"
}
