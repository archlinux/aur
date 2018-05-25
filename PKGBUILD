# Maintainer: Anton Karmanov <bergentroll@insiberia.net>

pkgname=libgraph
pkgver=1.0.2
pkgrel=1
pkgdesc="Lib Graphics — Turbo C's graphics.h on Linux"
arch=('x86_64')
url="savannah.nongnu.org/projects/libgraph"
license=('GPL2')
depends=('sdl' 'sdl_image' 'guile1.8')
source=("https://download.savannah.gnu.org/releases/libgraph/$pkgname-$pkgver.tar.gz")
md5sums=('6093bf0a9a65a5b873836276c9954194')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
