# Maintainer: saxonbeta <saxonbeta at gmail _ com>
pkgname=qnotero
pkgver=1.0.0
pkgrel=2
pkgdesc="A Qt application which provides access to your Zotero references"
arch=(any)
url="http://cogsci.nl/software/qnotero"
license=('GPL')
depends=('python-pyqt4' 'pdftk-bin' 'desktop-file-utils')
optdepends=(
  'gnote: for integration with gnote'
  'python-levenshtein: for integration with gnote'
)
provides=("gnotero")
replaces=("gnotero")
source=(https://github.com/smathot/${pkgname}/archive/release/${pkgver}.tar.gz)
sha256sums=('e577a8fa3d77006f6f6e5851510ba0e2aa2ebec0895cd80813cbefa98aa3ef67')
install=qnotero.install

build() {
  cd "$srcdir/$pkgname-release-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-release-$pkgver"
  python setup.py install --root=$pkgdir

}
