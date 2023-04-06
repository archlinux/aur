# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

_pkgname=pyhcl
pkgname=python-pyhcl
pkgver=0.4.4
pkgrel=4
pkgdesc='HCL configuration parser for python'
arch=(any)
url='https://pypi.org/project/pyhcl/'
license=(MPL2)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('2d9b9dcdf1023d812bfed561ba72c99104c5b3f52e558d595130a44ce081b003')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

check() {
  cd $_pkgname-$pkgver
  PYTHONPATH="$PWD/src" pytest tests
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
