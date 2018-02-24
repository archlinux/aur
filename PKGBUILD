# $Id$
# Maintainer: Maxim Polishchuck <mpolishchuck@gmail.com>

pkgname=keepassx-zero-git
pkgver=0.4.4
pkgrel=1
pkgdesc='KeePassX 0.4.4, customised to provide some convenience'
arch=('i686' 'x86_64')
url='http://www.keepassx.org'
license=('GPL2')
depends=('libxtst' 'qt4' 'shared-mime-info')
makedepends=('optipng')
source=("keepassx-zero::git+https://github.com/mpolishchuck/keepassx-zero.git")
sha256sums=('SKIP')

prepare() {
  cd keepassx-zero
  find -name '*.png' -exec optipng -quiet -force -fix {} \;
}

build() {
  cd keepassx-zero
  qmake-qt4
  make
}

package() {
  cd keepassx-zero
  make INSTALL_ROOT="$pkgdir" install
}
