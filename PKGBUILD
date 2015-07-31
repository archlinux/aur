# Maintainer: illuser <lykouleon dot eve at gmail dot com>

pkgname=zshdb-git
pkgver=0.09.r20.gc930e33
pkgrel=1
pkgdesc='A debugger for zsh scripts.'
arch=('i686' 'x86_64')
url='https://github.com/rocky/zshdb'
license=('GPL')
depends=('zsh')
makedepends=('git')
provides=('zshdb')
source=('git+git://github.com/rocky/zshdb.git')
md5sums=('SKIP')

pkgver() {
  cd zshdb
  git describe --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd zshdb
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd zshdb
  make DESTDIR=$pkgdir install
}