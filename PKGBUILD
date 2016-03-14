# Maintainer: Nickolay Mardanov <soniczerops@gmail.com>

pkgname=xkblayout-state
pkgver=20150804
pkgrel=1
pkgdesc="A small command-line program to get/set the current keyboard layout."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/nonpop/xkblayout-state"
provides=('xkblayout-state')
conflicts=('xkblayout-state')
depends=('libx11')
makedepends=('git' 'gcc')
source=('git+https://github.com/nonpop/xkblayout-state.git')
md5sums=('SKIP')

_gitname="xkblayout-state"
_gitbranch="master"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  install -Dm755 "xkblayout-state" "$pkgdir/usr/bin/xkblayout-state"  
}
