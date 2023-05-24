# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

_realname="CPyCppyy"
pkgname="cpycppyy"
pkgver=1.12.13
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings for CPython"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'cppyy-backend' 'python-wheel')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/7f/7b/bda6c9f3b72051114db4d9eedb70075548103baadfd86c487ac925dc4d5d/${_realname}-${pkgver}.tar.gz")
sha256sums=('f8c8c05b1eb8f0ccaed07b5069efabecff791bbe5e1b5be86767d32974e833d4')

build() {
  cd $srcdir/${_realname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_realname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

