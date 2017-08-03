# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail>

_pkgname=tmux-mem-cpu-load
pkgname=$_pkgname-git
pkgver=3.4.0.r10.g75b9ea7
pkgrel=1
pkgdesc="CPU, RAM memory, and load monitor for use with tmux"
url="https://github.com/thewtex/tmux-mem-cpu-load"
arch=('i686' 'x86_64')
license=('APACHE')
makedepends=('cmake')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git+https://github.com/thewtex/tmux-mem-cpu-load)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake .
  make
}

package() {
  cd $pkgname
  install -Dm755 tmux-mem-cpu-load "$pkgdir/usr/bin/tmux-mem-cpu-load"
}

