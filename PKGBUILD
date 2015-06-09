# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-setuptools_scm
_pkgname=setuptools_scm
pkgver=1.5.3
pkgrel=1
pkgdesc="Handles managing your python package versions in scm metadata."
arch=('any')
url="https://github.com/pypa/setuptools_scm"
license=('MIT')
depends=('python')
source=("https://github.com/pypa/setuptools_scm/archive/v1.5.3.tar.gz")
md5sums=('0cda7bb11a372bdc5e61a1bbf6bc6886')


build() {
  cd "${srcdir}/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-$pkgver"

  python setup.py egg_info
  python setup.py install --root "$pkgdir"
}
