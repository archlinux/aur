# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-pydstool
_pkgname=${pkgname#python2-}
pkgver=0.90.2
pkgrel=1
pkgdesc="Simulation and analysis environment for dynamical systems"
url="http://www.ni.gsu.edu/~rclewley/PyDSTool/FrontPage.html"
license=('BSD')
arch=('any')
depends=('python2-numpy' 'python2-scipy')
makedepends=('dos2unix')
optdepends=('python2-sloppycell')
replaces=('pydstool')
source=("https://github.com/robclewley/$_pkgname/archive/v$pkgver.tar.gz")
options=('!emptydirs')
md5sums=('35d69eae98b1c191d4689334862620f6')

build() {
  cd "$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --skip-build --prefix="/usr" --root="$pkgdir" --optimize=1
}
