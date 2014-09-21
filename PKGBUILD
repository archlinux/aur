# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=gcedit
pkgver=0.4.2
pkgrel=1
pkgdesc="GameCube disk image editor"
arch=(any)
url=http://ikn.org.uk/GCEdit
license=(GPL3)
depends=("python>=3.2" python-gobject)
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('9ea7e502cca9555a09fa0d695a87e7e5')

build () {
    cd "$srcdir/${pkgname}-$pkgver"
    ./configure
    make
}

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
}
