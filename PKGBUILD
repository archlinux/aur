# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Ex-Maintainer: William Turner <willtur.will@gmail.com>
pkgname='python-fontmath'
_pkgname=fontMath
pkgver=0.5.2
pkgrel=1
pkgdesc='A set of objects for performing math operations on font data.'
arch=('any')
url='https://github.com/typesupply/fontMath'
license=('MIT')
makedepends=()
depends=('python-fonttools')
checkdepends=('python-pytest')
options=(!emptydirs)
source=("https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.zip")
sha256sums=('9f7934f85859f057f8e6ff3fc2e80c1cd3ba8c9021e71a7794efdf74c6a49ce2')

package() {

  cd "${srcdir}/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir || return 1
}

check() {
  cd "${srcdir}/$_pkgname-$pkgver"
  python setup.py test
}
