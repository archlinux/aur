# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=tellmewhen
pkgver=0.1.0
pkgrel=1
pkgdesc="Utility for managing short timers in real time"
arch=(any)
url=http://ikn.org.uk/tellmewhen
license=(GPL3)
depends=("python>=3.3")
source=(http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8f7b2d11af3df70290dc3b43235f5698')

build () {
    cd "$srcdir/${pkgname}-$pkgver"
    ./configure
    make
}

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
}
