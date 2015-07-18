# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-setuptools_scm
_pkgname=setuptools_scm
pkgver=1.5.5
pkgrel=1
pkgdesc="Handles managing your python package versions in scm metadata."
arch=('any')
url="https://github.com/pypa/setuptools_scm"
license=('MIT')
depends=('python')
source=("https://github.com/pypa/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('9e642db2f2d61b58698ceeda9ffccf7a')


build() {
  cd "${srcdir}/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-$pkgver"

  python setup.py egg_info
  python setup.py install --root "$pkgdir"
}
