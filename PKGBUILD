# Maintainer : M0Rf30

pkgname=akabeicore-git
pkgver=579.0c9c444
pkgrel=1
pkgdesc="Core library for Akabei, Chakra’s package manager"
arch=('i686' 'x86_64')
url="https://gitorious.org/chakra/akabeicore"
license=('GPL')
depends=('kdelibs' 'libarchive' 'sqlite3')
makedepends=('cmake' 'automoc4' 'translate-toolkit' 'git')
source=("akabeicore::git://gitorious.org/chakra/akabeicore.git")


build() {
  cd akabeicore
  cmake . -DCMAKE_INSTALL_PREFIX=/usr 
  make || return 1
}
package() {
  cd akabeicore
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd akabeicore
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
