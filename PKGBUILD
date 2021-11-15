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
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('841e9776a896b14445e88353a9be476c48faa543cb51b6999c7e5c4c819b4e7ac646957836dd284e55c0a104f9cddcd552af00a0d60ff19e668ad36f0dc557a8')

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
