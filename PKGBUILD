# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-dash-table
pkgver=4.4.1
pkgrel=1
pkgdesc="A First-Class Interactive DataTable for Dash"
arch=('any')
url=https://github.com/plotly/dash-table
license=('MIT')
depends=(python python-dash)
makedepends=(python-setuptools)
source=(https://github.com/plotly/dash-table/archive/v${pkgver}.tar.gz)
sha256sums=('30edb179bf5d5eaa24c0f2411d3bb94ddba6bd2abcbc0981301ed015e8ba7bd8')

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
