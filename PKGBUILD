# Maintainer: Joshua Rubin <me at jawa dot dev>

pkgname=wdsp-git
_pkgname=wdsp
pkgver=r56.c55342c
pkgrel=1
pkgdesc='A collection of scripts using the VOACAP HF propagation prediction engine'
arch=('x86_64')
url='https://github.com/g0orx/wdsp'
license=('GPL2')
depends=()
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/g0orx/${_pkgname}")
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
sha384sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -D wdsp.h "${pkgdir}/usr/include/wdsp.h"
  install -D libwdsp.so "${pkgdir}/usr/lib/libwdsp.so"
}
