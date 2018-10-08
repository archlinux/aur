# Maintainer: TuxnVape Elrondo46 <elrond94athotmail.com>
# CoMaintainer: Frederic Bezies < fredbezies at gmail dot com>

pkgname=ne-git
pkgver=3.1.2.r0.g5a9618e
pkgrel=1
pkgdesc="A nice developer editor, highly recommended by Episteak French 
School - git version"
arch=('i686' 'x86_64')
url="https://github.com/vigna/ne"
license=('GPL3')
makedepends=('git')
depends=('ncurses')
provides=('ne')
conflicts=('ne')
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
