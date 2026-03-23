# Maintainer: kotoxik <mostlys4nny@gmail.com>
pkgname=alu81a-rgb
pkgver=1.0.3
pkgrel=1
pkgdesc="CLI RGB controller for Dark Project Terra Nova/Nostra (ALU81A) keyboard via hidraw"
arch=('x86_64' 'aarch64')
url="https://github.com/IlyaKotomin/alu81a-rgb"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('48f7b8b59cb8d69b9cd187a173aaac0de067759cc5be9cf6d59b251930925f0e')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
