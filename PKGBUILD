# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Mikhaul f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=python-fints
pkgver=4.2.3
pkgrel=1
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python' 'python-mt-940' 'python-bleach' 'python-sepaxml' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz")
sha512sums=(be22c163cdd635fb9ef3bdc00fe10f01f248161fa78d4a652a6fba4d1ad968f5a98474e0cd767fc100c426186b6310f54bd6d304341e70bc15c58bb51b6488a0)
b2sums=(6f9b20ff095fc5fae4285a780a415163c7c24c98ade537ab3bb122ef7ea3de191d0004cd7d49fa66aa78ce5fe9c282103916a07fc3722cbb32ea81faf5fdf1b0)

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
