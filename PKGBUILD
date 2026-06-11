# Maintainer: Alessandro Chitarrini <alessandro.chitarrini51@gmail.com>
pkgname=sw-stopwatch
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal terminal stopwatch written in pure C"
arch=('x86_64' 'aarch64')
url="https://github.com/chitvs/sw"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4409ac30052853dba2fefd4c9149f80c9568ba7982fc292787bf00d274057e02')

build() {
    cd "sw-$pkgver"
	make
}

package() {
    cd "sw-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
