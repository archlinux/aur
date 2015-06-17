# Maintainer : M0Rf30

pkgname=akabei-git
pkgver=286.d29fab4
pkgrel=1
pkgdesc="Chakra’s CLI package manager"
arch=('i686' 'x86_64')
url="https://gitorious.org/chakra/akabei"
license=('GPL')
depends=('kdelibs' 'libarchive' 'sqlite3' 'akabeicore-git' 'akabeiclient-git')
makedepends=('cmake' 'automoc4' 'translate-toolkit' 'git')
source=("akabei::git://gitorious.org/chakra/akabei.git")


build() {
  cd akabei
  cmake . -DCMAKE_INSTALL_PREFIX=/usr 
  make || return 1
}
package() {
  cd akabei
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd akabei
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
