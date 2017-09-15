# Maintainer: TuxnVape Elrondo46 <elrond94athotmail.com>
# CoMaintainer: Frederic Bezies < fredbezies at gmail dot com>

pkgname=ne-git
pkgver=3.1.1.r6.g5ad3d57
pkgrel=1
pkgdesc="A nice develloper editor, highly recommanded by Episteak French School"
arch=('any')
url="https://github.com/vigna/ne"
license=('GPL3')
makedepends=('git')
depends=('ncurses')
source=('git+https://github.com/vigna/ne.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ne"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
cd "$srcdir/ne"
make 
}

package() {
cd "$srcdir/ne"
make install PREFIX=$pkgdir/usr
}
