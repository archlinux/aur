# Maintainer: Daniel YC Lin <dlin.tw at gmail>

pkgname=tmux-mem-cpu-load-git
pkgver=3.2.1.r4.g557528b
pkgrel=1
pkgdesc="CPU, RAM memory, and load monitor for use with tmux"
url="https://github.com/thewtex/tmux-mem-cpu-load"
arch=('i686' 'x86_64' 'sh4')
license=('APACHE')
depends=(gcc-libs)
makedepends=('cmake>=2.6')
source=('repo::git+https://github.com/thewtex/tmux-mem-cpu-load')
md5sums=('SKIP')

pkgver() {
  cd repo
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
  cd repo
  cmake .
  make
}
package() {
  cd repo
  install -Dm755 tmux-mem-cpu-load $pkgdir/usr/bin/tmux-mem-cpu-load
}
# vim:et sw=2 ts=2 ai
