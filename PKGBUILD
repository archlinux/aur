# Maintainer: willemw <willemw12@gmail.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Rafael Beraldo <rafaelluisberaldo@gmail.com>

#pkgname=todo-c-git
pkgname=todo.c-git
pkgver=0.2.6.r11.g3a6c7f9
pkgrel=1
pkgdesc="Command line lightweight todo tool with readable storage, written in C"
arch=('x86_64')
url="https://github.com/hit9/todo.c"
license=('BSD')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'todo')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C $pkgname
}

package() {
  install -Dm755 $pkgname/src/todo -t "$pkgdir/usr/bin"
}

