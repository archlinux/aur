# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_project="pyjacklib"
pkgname="python-${_project}"
pkgname="python-pyjacklib"
pkgdesc="Python bindings for libjack using ctypes"
pkgver=0.1.0
pkgrel=1
arch=('any')
url="https://github.com/jackaudio/pyjacklib"
license=('GPL')
depends=('jack' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_project::1}/${_project}/${_project}-${pkgver}.tar.gz")
sha256sums=('250c6d3881d0932e445648201e90560ebca7668494721d246311155ef0734d24')


build() {
  cd "${srcdir}/${_project}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_project}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
