# Maintainer: sillybanaja <https://github.com/sillybanaja>
pkgname=drop-xdnd
pkgver=1.0.1
pkgrel=3
pkgdesc="cli drag-and-drop for x11 without the drag, pass files, click window"
arch=('x86_64')
url="https://github.com/sillybanaja/drop"
license=('GPL3')
depends=('libx11' 'libxi')
conflicts=('drop')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sillybanaja/drop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5975c7f627ecec1862b4cafce0b92da646fa070ad00305bddb2a7add7d7b8675')

package() {
    cd "drop-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
