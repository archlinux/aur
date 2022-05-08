# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-pybase62
_pkgname=pybase62
pkgver=0.5.0
pkgrel=1
pkgdesc="Python module for base62 encoding"
arch=("any")
url="https://github.com/suminb/base62"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE")
b2sums=('f668c960e9b4a4f6d2e9a4434302721482012620380edda6d5f76aa47b85374bb2bc633377f97a45fc972302bfb6761faf1fb3e7b40ebb478830f6f3274bd0e0'
        '15ac4206d2135363a107f01880ccfb41d1199a9f431fe3fa78f04278b73b6fc3697079bb17c41e9b8c2ace8a9bc4a5b0ad4d0e6d09b3a2f40035d945c8c38a9a')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
