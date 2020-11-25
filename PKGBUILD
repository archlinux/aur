# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

_realname="CPyCppyy"
pkgname="cpycppyy"
pkgver=1.12.0
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings for CPython"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'cppyy-backend' 'python-wheel')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/88/12/ff773a4743a1d147f17299c49e3cc65039f2fd4d790421c7b5c695ae9d89/${_realname}-${pkgver}.tar.gz")
sha256sums=('b10a91f837ea6d894ba1cdf1c37c7b8b044a9926cf917e6e97e337ef81baa26c')

build() {
  cd $srcdir/${_realname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_realname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

