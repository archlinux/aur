# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ezdxf
pkgver=0.12
pkgrel=1
pkgdesc="Python interface to DXF"
arch=('any')
url=https://ezdxf.mozman.at/
license=('MIT')
depends=(python python-pyparsing)
makedepends=(python-setuptools)
source=(https://github.com/mozman/ezdxf/archive/v${pkgver}.tar.gz)
sha256sums=('1f62771c69e51cbf26a762a796c9d7bcfb7e41ff2c80cd091244590bf7dacf1f')

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
