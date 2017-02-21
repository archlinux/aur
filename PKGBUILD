# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=sixcells
pkgver=2.4.3
pkgrel=1
pkgdesc="Level editor for Hexcells"
arch=(any)
url='https://github.com/oprypin/sixcells'
license=(GPL3)
depends=('python' 'python-pyqt5' 'python-pulp')
optdepends=('glpk: Faster solver for PuLP')
source=("https://github.com/oprypin/sixcells/archive/v${pkgver}.tar.gz")
sha256sums=('f5854fe623286a80def76a8e51fd48a73774ce2a66039a2311670ad7e77ec05e')

package() {
  cd "$pkgdir"

  mkdir -p "usr/lib"
  cp -r "$srcdir/$pkgname-$pkgver" "usr/lib/$pkgname"

  mkdir -p "usr/bin"
  ln -s "/usr/lib/$pkgname/editor.py" "usr/bin/sixcells-editor"
  ln -s "/usr/lib/$pkgname/player.py" "usr/bin/sixcells-player"
}
