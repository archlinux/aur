# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

_realname="CPyCppyy"
pkgname="cpycppyy"
pkgver=1.10.1
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings for CPython"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'cppyy-backend' 'python-wheel')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/12/01/65f004180036a1da973a584bc621dcaad0281ea18cfeb02cd15720dd5cdf/${_realname}-${pkgver}.tar.gz")
sha256sums=('fdf43a35939672a1b42b30a1c48ac1ba4fef7372233e7d169dbf4e5ee26346a4')

build() {
  cd $srcdir/${_realname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_realname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

