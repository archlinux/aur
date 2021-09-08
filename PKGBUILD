pkgname=find-cursor
pkgver=1.7
pkgrel=1
pkgdesc="Simple XLib program to highlight the cursor position in X11"
arch=('x86_64')
url="https://github.com/arp242/find-cursor"
license=('MIT')
depends=(libx11 libxcomposite libxdamage libxrender)
source=("https://github.com/arp242/find-cursor/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ee50e5bedae92eec6b0f88a0dc1a6e9b783d2c34207b9b08e50dc7af069d610')

build() {
    cd "$srcdir/find-cursor-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/find-cursor-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
