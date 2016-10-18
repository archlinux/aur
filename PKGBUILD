# Maintainer: Christopher Woodruff <cswoodruff@gmail.com>

pkgname=python-pyficache
_pkgname=pyficache
pkgver=0.3.0
pkgrel=1
pkgdesc='Cache lines and file information which are generally Python programs'
arch=('any')
url="https://pypi.python.org/pypi/pyficache"
license=('LGPL3')
depends=('python-coverage')
makedepends=('python-setuptools')
replaces=()
conflicts=()
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('ab7c693c9b698d77b3670b7bc95c0789')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}" -O1
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
