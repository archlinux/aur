# Maintainer: saxonbeta <saxonbeta at gmail _ com>
#Contributor: Thomas Jost  <schnouki at schnouki _ net>
pkgname=qnotero
pkgver=2.2.0
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
sha256sums=('14cdaaae1298be907d7a3e65b69faa067d14a4e25b5f0439421c152815bf20f5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}
