# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-dash-table
pkgver=4.12.1
pkgrel=1
pkgdesc="A First-Class Interactive DataTable for Dash"
arch=('any')
url=https://github.com/plotly/dash-table
license=('MIT')
depends=(python python-dash)
makedepends=(python-setuptools)
source=(https://github.com/plotly/dash-table/archive/v${pkgver}.tar.gz)
sha256sums=('3fddc2be402f9a66b09ad7f355c42a713d441e5b647db63aea7fba6c2d7aa8da')

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
