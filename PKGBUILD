# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-dash-daq
pkgver=0.2.2
pkgrel=1
pkgdesc="Control components for Dash"
arch=('any')
url=https://github.com/plotly/dash-daq
license=('MIT')
depends=(python python-dash)
makedepends=(python-setuptools)
source=(https://github.com/plotly/dash-daq/archive/v${pkgver}.tar.gz)
sha256sums=('0909d5556760f8caa7e2b3e8c48e4e4e812cb1a66422e4c59ceb7cee498982c1')

prepare() {
  cd "$srcdir/dash-daq-$pkgver"
  #versioneer install 
}

build() {
  cd "$srcdir/dash-daq-$pkgver"
  python setup.py build
}


package() {
  cd "$srcdir/dash-daq-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
