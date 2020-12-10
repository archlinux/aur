# Maintainer: TuxnVape Elrondo46 <elrond94athotmail.com>
# CoMaintainer: Frederic Bezies < fredbezies at gmail dot com>

pkgname=ne-git
pkgver=3.3.0.r11.gdb1b7d7
pkgrel=1
pkgdesc="A nice developer editor, highly recommended by Epitech 
(aka Episteak) French 
School - git version"
arch=('i686' 'x86_64')
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
