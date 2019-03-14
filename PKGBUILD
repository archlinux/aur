# Maintainer: kpcyrd <git@rxv.cc>

pkgname="python-fints"
pkgver="2.1.1"
pkgrel=1
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python-mt-940')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz)
sha512sums=('46f5f23656a253b7eacf84591002eb1e5c235d38d1a0cd2354fded972ab39afb50f6aee3ff81c501f33cdd5f2a3bbf5ea4abe219538564d1645bac45ceec833a')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
