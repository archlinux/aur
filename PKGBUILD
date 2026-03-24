# Maintainer: sillybanaja <https://github.com/sillybanaja>
pkgname=drop-xdnd
pkgver=1.0.1
pkgrel=1
pkgdesc="cli drag-and-drop for x11 without the drag, pass files, click window"
arch=('x86_64')
url="https://github.com/sillybanaja/drop"
license=('MIT')
depends=('libx11' 'libxi')
conflicts=('drop')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sillybanaja/drop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('163fe9d3f3115025da432e22c7d2c598322fa14bbe534aa1566f435808c885e8')

package() {
    cd "drop-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
