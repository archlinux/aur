# Maintainer: Lara Maia <lara@craft.net.br>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au>

pkgname=qconnman-git
pkgver=r202.g6b9d09b
pkgrel=1
epoch=4
pkgdesc="QConnman Library (Qt)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/OSSystems/qconnman"
license=('LGPL')
depends=('connman' 'qt4')
makedepends=('git')
source=(git+https://bitbucket.org/devonit/qconnman.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/qconnman
  local r=$(git rev-list --count HEAD)
  local h=$(git rev-parse --short HEAD)
  echo "r$r.g$h"
}

build() {
  cd "$srcdir"/qconnman
  qmake-qt4 PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/qconnman
  make INSTALL_ROOT="$pkgdir" install
}
