# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ezdxf
pkgver=0.13
pkgrel=1
pkgdesc="Python interface to DXF"
arch=('any')
url=https://ezdxf.mozman.at/
license=('MIT')
depends=(python python-pyparsing)
makedepends=(python-setuptools)
source=(https://github.com/mozman/ezdxf/archive/v${pkgver}.tar.gz)
sha256sums=('d89e9d2734b7e19535833f4b6e8ab906f2f19f9079660585bf87b7fb0100c404')

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
