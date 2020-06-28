# Maintainer: saxonbeta <saxonbeta at gmail _ com>
#Contributor: Thomas Jost  <schnouki at schnouki _ net>
pkgname=qnotero
pkgver=2.3.0
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
sha256sums=('f987fb3368e7dfa3789da46e20766b95f65c6a4521bf006386d875be7d28dfff')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}
