# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=python-pywalfox
_name=pywalfox
pkgver=2.2
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
sha256sums=('31c867053367f7e79560c4069b6dc4a701f63d217e39e391bfa0df603efab5bd')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
