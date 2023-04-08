# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-fints
pkgver=3.1.0
pkgrel=2
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python' 'python-mt-940' 'python-bleach' 'python-sepaxml' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz")
sha512sums=('321862507465eef2bf71826cfb2ce0292204f65a28a7bb562f305438744bb48ae4ec9344b04508dd5595f14b17862f2e0a9a059a96e947694de95f85a2831289')
b2sums=('4d49f41b5a070d35afa0840d94932ec461371b5fac63a53543e1aae3cbf5040edf53a4cdf9b1f3cbc5dfe1d6390f6574deef8288e5aab891bf56ea87636d8c3f')

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
