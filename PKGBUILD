# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-rtyaml
pkgver=1.0.0
pkgrel=1
pkgdesc='All the annoying things to make YAML usable in a source controlled environment.'
arch=('any')
url='https://github.com/unitedstates/rtyaml'
license=('CC0')
depends=('python' 'python-pyaml' 'libyaml')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/be/2f/e2b907ac01ecc56efac82b6fc9fa411403fe430f5e2e2e7ce86858bc1aab/rtyaml-${pkgver}.tar.gz")
sha256sums=('66aa6e2f2c8c29ccab9d1713072a4e06c52c6cdcfe27ebd50706df09638c4586')

_pkgname=rtyaml

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
