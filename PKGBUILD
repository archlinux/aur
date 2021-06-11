# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=python-pywalfox
_name=pywalfox
pkgver=2.7.3
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
sha256sums=('51ff30993089b78b414422c57d3a49e1ace3a851aa2b1ba1bb6c3fafbd657dbe')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
