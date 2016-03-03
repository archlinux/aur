# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=sixcells
pkgver=2.4.1
pkgrel=1
pkgdesc="Level editor for Hexcells"
arch=('any')
url='https://github.com/BlaXpirit/sixcells'
license=('GPL3')
depends=('python' 'python-pyside')
optdepends=('python-pulp: Required for solving puzzles'
            'glpk: Faster solver for PuLP')
source=("https://github.com/BlaXpirit/sixcells/archive/v${pkgver}.tar.gz")
sha256sums=('b1071b41113967d2349cc40e41b6112d0b991293a30af94f8ced8d09730d2819')

package() {
  cd "$pkgdir"

  mkdir -p "usr/lib"
  cp -r "$srcdir/$pkgname-$pkgver" "usr/lib/$pkgname"

  mkdir -p "usr/bin"
  ln -s "/usr/lib/$pkgname/editor.py" "usr/bin/sixcells-editor"
  ln -s "/usr/lib/$pkgname/player.py" "usr/bin/sixcells-player"
}
