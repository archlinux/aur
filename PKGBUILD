# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=znc-clientaway-git
pkgver=r30.9f1f98d
pkgrel=1
pkgdesc="ZNC module that sets clients away independently, and auto away"
arch=('i686' 'x86_64')
url='http://wiki.znc.in/Clientaway'
license=('GPL2')
depends=('znc')
source=('git+https://github.com/kylef/znc-contrib.git')
sha256sums=('SKIP')

pkgver() {
  cd znc-contrib &&
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd znc-contrib &&
  znc-buildmod clientaway.cpp
}

package() {
  cd znc-contrib &&
  install -Dm755 clientaway.so "$pkgdir/usr/lib/znc/clientaway.so"
}
