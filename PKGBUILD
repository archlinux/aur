# Maintainer: M0Rf30

pkgname=kmesstestserver-git
pkgver=69.a46f689
pkgrel=1
pkgdesc="A tool to debug the MSN protocol – by emulating a full WLM-compatible server."
arch=('i686' 'x86_64')
url="http://www.kmess.org/"
license=('GPL')
depends=('qt4')
makedepends=('git' 'kdebase-lib' 'cmake' 'automoc4')
source=("kmesstestserver::git://gitorious.org/kmess/kmesstestserver.git")


build() {
 cd kmesstestserver

 cmake . -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
                -DCMAKE_BUILD_TYPE=Release
 make
}

package() {
  cd kmesstestserver
  mkdir -p $pkgdir/usr/bin
  cp kmesstestserver $pkgdir/usr/bin
} 

pkgver() {
  cd kmesstestserver
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
