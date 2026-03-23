# Maintainer: kotoxik <mostlys4nny@gmail.com>
pkgname=alu81a-rgb
pkgver=1.0.2
pkgrel=1
pkgdesc="CLI RGB controller for Dark Project Terra Nova/Nostra (ALU81A) keyboard via hidraw"
arch=('x86_64' 'aarch64')
url="https://github.com/IlyaKotomin/alu81a-rgb"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba91eae4e86c7ef882f8a007ec10ef8dcdb67becfddead5ca19ce6ea87b97253')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
