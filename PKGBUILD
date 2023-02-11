# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-pybase62
_pkgname=pybase62
pkgver=0.6.0
pkgrel=1
pkgdesc="Python module for base62 encoding"
arch=("any")
url="https://github.com/suminb/base62"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE")
b2sums=('9093ccdc220ee9b7a0e24edc0320d66cf3ab71642a5742398b3fef04107787356b2f31bbb5740a7cfa479b66b4e26bda84c08442f7af907ba7aea4620f1221d1'
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
