# Maintainer: sillybanaja <https://github.com/sillybanaja>
pkgname=drop-xdnd
pkgver=1.0.0
pkgrel=1
pkgdesc="cli drag-and-drop for x11 without the drag, pass files, click window"
arch=('x86_64')
url="https://github.com/sillybanaja/drop"
license=('MIT')
depends=('libx11' 'libxi')
conflicts=('drop')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sillybanaja/drop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bfeb221f8098ba34bbb4bc0db82e7785b268c20d2801f3c436150acd9968b98d')

package() {
    cd "drop-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
