# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=python-pywalfox
_name=pywalfox
pkgver=2.7.2
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
sha256sums=('c15e48d940e50ed7209668dae6f50b776bba75acca9ab774bf4e55f586a07506')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
