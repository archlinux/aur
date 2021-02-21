# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=python-jsonpyth
pkgver=0.1.3
pkgrel=2
pkgdesc="Another JSONPath implementation for Python"
arch=(any)
url="https://github.com/Frimkron/JSONPyth"
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-pyparsing)
source=("${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip")
sha512sums=('c852447686ad430d2dabfba60724ccda278d029d9397af7bb1b7ffee5564870fe4c02c7246bb4245bc0b6f1742cfb278040d5a81ce21ed0ca4a076373a5cc0ca')

build() {
  cd "JSONPyth-${pkgver}"

  python3 setup.py build
}

check() {
  cd "JSONPyth-${pkgver}"

  python3 -m unittest
}

package() {
  cd "JSONPyth-${pkgver}"

  python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -D -m644 LICENCE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
