# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-rxv
pkgname=python-rxv
pkgver=0.7.0
pkgrel=1
pkgdesc="Automation Library for Yamaha RX-V473, RX-V573, RX-V673, RX-V773 receivers."
arch=('any')
url='https://github.com/wuub/rxv'
license=('BSD')
depends=('python-defusedxml')
makedepends=('python-setuptools')
checkdepends=('python')
source=("https://github.com/wuub/rxv/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('957dce69a2304d087c5fd9cd4c400b41efc1fc7579d3644a873877d32f09df43')

check() {
  cd "${srcdir}/rxv-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/rxv-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
