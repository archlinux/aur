# Maintainer: Straw <strawATpinnoto.org>
# Contributor: TuxnVape Elrondo46 <elrond94athotmail.com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>

pkgname=ne-git
pkgver=3.3.1.18.gaf55605
pkgrel=1
pkgdesc="The nice editor, easy to use for the beginner and powerful enough for the wizard - git version"
arch=('i686' 'x86_64' 'aarch64')
url="http://ne.di.unimi.it/"
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
