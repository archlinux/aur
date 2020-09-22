# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-dash-table
pkgver=4.10.0
pkgrel=1
pkgdesc="A First-Class Interactive DataTable for Dash"
arch=('any')
url=https://github.com/plotly/dash-table
license=('MIT')
depends=(python python-dash)
makedepends=(python-setuptools)
source=(https://github.com/plotly/dash-table/archive/v${pkgver}.tar.gz)
sha256sums=('543db13584324fb978da258f6f8ddf0e3f701cb6eefb6c739772fceaa4b6d3a2')

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
