# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ezdxf
pkgver=0.11
pkgrel=1
pkgdesc="Python interface to DXF"
arch=('any')
url=https://ezdxf.mozman.at/
license=('MIT')
depends=(python python-pyparsing)
makedepends=(python-setuptools)
source=(https://github.com/mozman/ezdxf/archive/v${pkgver}.tar.gz)
sha256sums=('88085dca0b0f7fb339b843ffa0cf14820137cedb42b026e89f9e306df61d8ae5')

prepare() {
  cd "$srcdir/ezdxf-$pkgver"
}

build() {
  cd "$srcdir/ezdxf-$pkgver"
  python setup.py build
}


package() {
  cd "$srcdir/ezdxf-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
