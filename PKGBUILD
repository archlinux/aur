pkgname=znc-fish
pkgver=r21.dfc4408
pkgrel=1
pkgdesc='FiSH Module for ZNC'
arch=('x86_64')
url='https://github.com/qnorsten/znc-fish'
license=('GPL')
depends=('znc')
makedepends=('cmake')
provides=('znc-fish')
#conflicts=('')
source=('git+https://github.com/qnorsten/znc-fish.git')
b2sums=('SKIP')
_gitname='znc-fish'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  znc-buildmod fish.cpp
}

package() {
  cd "$_gitname"
  install -Dm755 fish.so "${pkgdir}/usr/lib/znc/fish.so"
}
