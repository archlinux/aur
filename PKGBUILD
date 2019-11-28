# Maintainer: saxonbeta <saxonbeta at gmail _ com>
#Contributor: Thomas Jost  <schnouki at schnouki _ net>
pkgname=qnotero
pkgver=2.1.1
pkgrel=2
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
sha256sums=('0029465e3f1c131a0eaa797b31fffc2460838c9bb95824884cda6d1ec90e27f9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}
