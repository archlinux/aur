# Maintainer: Aaron Coach <aur at ezpz dot cz>

pkgname=python-wakeonlan
pkgver=2.1.0
pkgrel=1
pkgdesc="A small python module for wake on lan"
url="https://github.com/remcohaszing/pywakeonlan"
arch=(any)
license=('WTFPL')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/w/wakeonlan/wakeonlan-${pkgver}.tar.gz")
sha256sums=('c9deddcdf72256dd31f884b1c971c6d6af97730df2d33782cca8a9d3c28f2080')

prepare() {
  cd "${srcdir}"/wakeonlan-$pkgver
}

build() {
  cd "${srcdir}"/wakeonlan-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/wakeonlan-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}


