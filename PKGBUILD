# Maintainer: Joseph Lansdowne <J49137@gmail.com>
_pkgname=gw2buildutil
pkgname=python-$_pkgname
pkgver=0.5.1
pkgrel=1
pkgdesc="Python 3 library for working with Guild Wars 2 builds"
arch=(any)
url=http://ikn.org.uk/lib/gw2buildutil
license=(BSD)
makedepends=(python-setuptools)
depends=("python>=3.7")
source=("http://ikn.org.uk/download/lib/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('40a32c24eac76ae0161b39e0197c54acd454b5f7653911025a623d2b810c3e37')

build () {
    cd "$srcdir/${_pkgname}-$pkgver"
    make
}

package () {
    cd "$srcdir/${_pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -D LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}
