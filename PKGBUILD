# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=newgg-git
_gitname=NewGG
pkgver=22.fb435ef
pkgrel=1
pkgdesc="佳佳象棋-传统引擎"
# arch=('x86_64' 'i686' 'aarch64' 'armv7h')
arch=('x86_64')
url="https://github.com/leedavid/NewGG"
license=('unknown')
makedepends=('clang'
         'libc++')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_gitname}::git+${url}")
# MAKEFLAGS=-j4
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"

  make
}

package() {
  install -Dm755 ${srcdir}/"$_gitname"/newgg -t ${pkgdir}/usr/bin/
}

# vim: set sw=2 ts=2 et:

