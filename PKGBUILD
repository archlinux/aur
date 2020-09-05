# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=tellmewhen
pkgver=1.0.0
pkgrel=1
pkgdesc="Utility for managing short timers in real time"
arch=(any)
url=http://ikn.org.uk/tool/tellmewhen
license=(GPL3)
depends=("python>=3.3")
source=(http://ikn.org.uk/download/tool/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('473d88a6473a1c7e1b16f44be323133e')

build () {
    cd "$srcdir/${pkgname}-$pkgver"
    ./configure
    make
}

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
}
