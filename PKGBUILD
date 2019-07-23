# Maintainer: kpcyrd <git@rxv.cc>

pkgname="python-fints"
pkgver="2.2.0"
pkgrel=1
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python-mt-940' 'python-bleach' 'python-sepaxml' 'python-requests')
makedepends=('python-setuptools' 'python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz")
sha512sums=('cfbea179700f509a70a25fb5d3f905deda5b18659659d6701c9193cb634a6880a4be6fbdba4924e41202c2e6171da9d0365fbcc5249b945a524c17d18c21f64b')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  # tests are currently broken
  #PYTHONPATH=. pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
