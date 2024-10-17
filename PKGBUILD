# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=2.0.2
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=()
makedepends=('git' 'make' 'go')
source=("git+$url")
sha512sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    git checkout "v$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
