# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=python-pywalfox
_name=pywalfox
pkgver=2.5
pkgrel=1
pkgdesc="Native app used alongside the Pywalfox browser extension"
arch=('any')
url='https://github.com/frewacom/pywalfox'
license=('MPL2')
depends=(
  'python'
)
makedepends=(
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/p/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dfa9078ac2478860fdeaefba39e2eb7bc1cb1c1bda9e5f33cd490179af9ba165')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
