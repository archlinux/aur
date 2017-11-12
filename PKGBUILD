# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Christos Nouskas <nous at archlinux dot us>
# Contributor: Jakub Luzny <limoto94@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=arora-git
pkgrel=1
pkgver=0.11.0.27.ga2d1975
pkgdesc="A lightweight, cross-platform Qt4 WebKit browser"
arch=('i686' 'x86_64')
url="https://github.com/arora/arora"
license=('GPL2')
depends=('qt4' 'qtwebkit')
makedepends=('git')
provides=('arora')
conflicts=('arora')
source=("git://github.com/Arora/arora.git")
sha256sums=('SKIP')
_gitname="arora"

pkgver() {
  cd "$srcdir/$_gitname"
  echo "$(git describe --always | sed 's/-/./g')"
}

build() {
  cd "$srcdir/$_gitname"
  qmake-qt4 PREFIX=/usr
  make sub-src-qmake_all
  make
}

package() {
  cd "$srcdir/$_gitname"
  make INSTALL_ROOT="$pkgdir" install
}
