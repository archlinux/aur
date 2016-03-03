# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=znc-chanfilter-git
pkgver=r62.cdfd196
pkgrel=2
pkgdesc="ZNC channel filter module for identified clients"
arch=('i686' 'x86_64')
url='http://wiki.znc.in/Chanfilter'
license=('Apache')
depends=('znc')
source=('git+https://github.com/jpnurmi/znc-chanfilter.git')
sha256sums=('SKIP')

pkgver() {
  cd znc-chanfilter &&
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd znc-chanfilter &&
  znc-buildmod chanfilter.cpp
}

package() {
  cd znc-chanfilter &&
  install -Dm755 chanfilter.so "$pkgdir/usr/lib/znc/chanfilter.so"
}
