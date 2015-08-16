# Maintainer: Lara Maia <lara@craft.net.br>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au>

pkgname=qconnman-git
pkgver=1.24
pkgrel=1
epoch=4
pkgdesc="QConnman Library (Qt)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/OSSystems/qconnman"
license=('LGPL')
depends=('connman' 'qt4')
makedepends=('git')
conflicts=("qconnman")
provides=("qconnman=$pkgver")
source=(git+https://bitbucket.org/devonit/qconnman.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/qconnman
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
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
