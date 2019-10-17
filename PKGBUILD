# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-dash-table
pkgver=4.4.0
pkgrel=1
pkgdesc="A First-Class Interactive DataTable for Dash"
arch=('any')
url=https://github.com/plotly/dash-table
license=('MIT')
depends=(python python-dash)
makedepends=(python-setuptools)
source=(https://github.com/plotly/dash-table/archive/v${pkgver}.tar.gz)
sha256sums=('020573802a873c96ae72a2a720d8f3b8930c46d58276bbee2c8e2cf1b80ac8f2')

prepare() {
  cd "$srcdir/dash-table-$pkgver"
  #versioneer install 
}

build() {
  cd "$srcdir/dash-table-$pkgver"
  python setup.py build
}


package() {
  cd "$srcdir/dash-table-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
