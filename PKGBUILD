# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-fints
pkgver=4.0.0
pkgrel=1
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python' 'python-mt-940' 'python-bleach' 'python-sepaxml' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz")
sha512sums=('0a3fe337826d0d1545e46d9debca1a5025eb26c94f2fc899af1e66d4f2def55141e70d930bcf5ac119008afca8411cfb519b5a24e100b0df91d1d250bcd0f109')
b2sums=('e7952dd6e4f96a5b80853a6cd515700ff8264ba7339b430e8988c8c4d6fa9145b3450f6e4373e43e82c32e5b0f55d1be8657f6ce825135374a57ab1b2349c098')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=. pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
}

# vim:set ts=2 sw=2 et:
