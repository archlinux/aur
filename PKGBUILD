# Contributor: Niklas <dev@n1klas.net>

_base=python-otr
pkgname=${_base/-/2-}
pkgver=1.2.2
pkgrel=1
pkgdesc="Off-The-Record Messaging (OTR) protocol implementation for python"
arch=(any)
url="https://pypi.org/project/${_base}"
license=('LGPL')
depends=(python2-cryptography python2-gmpy python2-zope-interface) # python2-application
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('7370bf53dafbeed4106a6fde9309b906f11cf744e351549ad9fc2df07d2b8998f5c12ca3387925920bd830e277ed7fae0e6c0a078d7c944bd4e28dcf0d37cd15')

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
