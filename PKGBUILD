# Maintainer: saxonbeta <saxonbeta at gmail _ com>
#Contributor: Thomas Jost  <schnouki at schnouki _ net>
pkgname=qnotero
pkgver=2.0.1
pkgrel=1
pkgdesc="A Qt application which provides access to your Zotero references"
arch=(any)
url="https://github.com/ealbiter/qnotero"
license=('GPL')
depends=('python-qtpy')
optdepends=(
  'gnote: for integration with gnote'
  'python-levenshtein: for integration with gnote'
)
provides=("gnotero")
replaces=("gnotero")
source=(https://github.com/ealbiter/qnotero/archive/v${pkgver}.tar.gz)
sha256sums=('8f280a432ae732360d742627e56872e79fbaa769f09c2e76c17cb170dc3be71f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}
