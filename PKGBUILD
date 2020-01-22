# Maintainer: Joseph Lansdowne <J49137@gmail.com>
_pkgname=pyepgdb
pkgname=python-$_pkgname
pkgver=1.1.0
pkgrel=1
pkgdesc="Python 3 library for parsing Tvheadend epgdb files"
arch=(any)
url=http://ikn.org.uk/pyepgdb
license=(BSD)
makedepends=(python-setuptools)
depends=("python>=3.4")
source=(http://ikn.org.uk/files/library/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha1sums=('bbbc760f34ad178a327d1c09d19c6f0adc573f1f')

build () {
    cd "$srcdir/${_pkgname}-$pkgver"
    make
}

package () {
    cd "$srcdir/${_pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -D LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}

check () {
    cd "$srcdir/${_pkgname}-$pkgver"
    make test
}
