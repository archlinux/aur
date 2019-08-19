# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Ex-Maintainer: William Turner <willtur.will@gmail.com>
pkgname='python-fontmath'
_pkgname=fontMath
pkgver=0.5.0
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
sha256sums=('f455c8f76277ba9e9ee36d60b79c25d8ddbb20f55983713731ed0234c716e378')

package() {

  cd "${srcdir}/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir || return 1
}

check() {
  cd "${srcdir}/$_pkgname-$pkgver"
  python setup.py test
}
