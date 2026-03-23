# Maintainer: kotoxik <mostlys4nny@gmail.com>
pkgname=alu81a-rgb
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI RGB controller for Dark Project Terra Nova/Nostra (ALU81A) keyboard via hidraw"
arch=('x86_64' 'aarch64')
url="https://github.com/IlyaKotomin/alu81a-rgb"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41fbfa1d26d418ed261ccd0cff15a962872b0831081d5752f444fe01acb32620')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
