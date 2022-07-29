# Maintainer: saxonbeta <saxonbeta at gmail _ com>
#Contributor: Thomas Jost  <schnouki at schnouki _ net>
pkgname=qnotero
pkgver=2.3.1
pkgrel=1
pkgdesc="A Qt application which provides access to your Zotero references"
arch=(any)
url="https://github.com/ealbiter/qnotero"
license=('GPL')
depends=('python-pyqt5')
optdepends=(
  'gnote: for integration with gnote'
  'python-levenshtein: for integration with gnote'
)

source=(https://github.com/ealbiter/qnotero/archive/v${pkgver}.tar.gz)
sha256sums=('15125a9296d8ad0f49addcbda7cffc356d1aef26b2f238f4450b1f5dd166eb39')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}
