# Contributor: Alexander R. <sbir@list.ru>
# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=tcc-git
pkgver=0.9.26.r819.g7e7f2e5
pkgrel=1
pkgdesc='Tiny C Compiler'
arch=('x86_64' 'i686')
url='http://bellard.org/tcc/'
license=('LGPL2.1')
makedepends=('texi2html' 'git')
provides=('tcc')
conflicts=('tcc')
options=('staticlibs')
source=('git://repo.or.cz/tinycc.git')
md5sums=('SKIP')

pkgver() {
  cd tinycc
  git describe | sed 's/^release_//; s/_/./g; s/-/.r/; s/-/./'
}

build() {
  cd tinycc
  ./configure --prefix=/usr
  make
}

check() {
  cd tinycc
  make test
}

package() {
  make -C tinycc DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
