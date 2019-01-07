# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-pydstool
_pkgname=${pkgname#python2-}
pkgver=0.90.2
pkgrel=1
pkgdesc="Simulation and analysis environment for dynamical systems"
url="http://pydstool.sf.net/"
license=('BSD')
arch=('any')
depends=('python2-numpy' 'python2-scipy')
makedepends=('dos2unix')
optdepends=('python2-sloppycell')
checkdepends=('python2-pytest' 'python2-pytest-xdist' 'python2-mock')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/robclewley/$_pkgname/archive/v$pkgver.tar.gz")
options=('!emptydirs')
sha256sums=('f8fd7aa0f5c48d18b93f76e0086c4faf204e9fee9f32851f52bb67fa1450c891')

build() {
  cd "$_pkgname-$pkgver"
  python2 setup.py build
}

# ERROR: file not found: discover
# check() {
#   cd "$_pkgname-$pkgver"
#   python2 setup.py test
# }

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
