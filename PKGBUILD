# Maintainer : M0Rf30

pkgname=akabeiclient-git
pkgver=301.de5b490
pkgrel=1
pkgdesc="Client library for Akabei, Chakra's package manager"
arch=('i686' 'x86_64')
url="https://gitorious.org/chakra/akabeiclient"
license=('GPL')
depends=('kdelibs' 'libarchive' 'sqlite3')
makedepends=('cmake' 'automoc4' 'translate-toolkit' 'git')
source=("akabeiclient::git://gitorious.org/chakra/akabeiclient.git")


build() {
  cd akabeiclient
  cmake . -DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd akabeiclient
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd akabeiclient
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
