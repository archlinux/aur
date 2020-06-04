# Maintainer:  Liam Timms <timms5000@gmail.com>
pkgname=python-ci-info
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc="A Python implementation of watson/ci-info. Data on Continuous Integration environment."
arch=('any')
url='https://github.com/mgxd/ci-info'
license=('MIT')
depends=('python-pytest')
makedepends=()
optdepends=()
source=("${_name}-${pkgver}.tar.gz::https://github.com/mgxd/${_name}/archive/${pkgver}.tar.gz")
md5sums=('6c0f263aaff41772d3fe8c4236c3dd91')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

