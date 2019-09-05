# Maintainer: saxonbeta <saxonbeta at gmail _ com>
#Contributor: Thomas Jost  <schnouki at schnouki _ net>
pkgname=qnotero
pkgver=2.0.0
pkgrel=1
pkgdesc="A Qt application which provides access to your Zotero references"
arch=(any)
url="https://github.com/saxonbeta/qnotero"
license=('GPL')
depends=('python-qtpy' 'pdftk-bin')
optdepends=(
  'gnote: for integration with gnote'
  'python-levenshtein: for integration with gnote'
)
provides=("gnotero")
replaces=("gnotero")
source=(https://github.com/saxonbeta/qnotero/archive/${pkgver}.tar.gz)
sha256sums=('823bcec8f6c63c5a36c8c4e621e2dcc41961c8922c638dfea0bb6acb49cff197')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}
