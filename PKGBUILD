# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Rob McCathie aka korrode <archaur at rmcc dot com dot au>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>

_name=bison
pkgname=bison27
pkgver=2.7.1
pkgrel=4
pkgdesc='General-purpose parser generator'
arch=('x86_64' 'i686')
license=('GPL3')
url='http://www.gnu.org/software/bison/bison.html'
depends=('glibc' 'm4')
groups=('base-devel')
provides="bison=$pkgver"
conflicts='bison'
install=bison.install
source=("ftp://ftp.gnu.org/gnu/bison/$_name-$pkgver.tar.xz")
sha256sums=('b409adcbf245baadb68d2f66accf6fdca5e282cafec1b865f4b5e963ba8ea7fb')

build() {
  cd "$_name-$pkgver"
  ./configure --prefix=/usr --datadir=/usr/share
  make
}

package() {
  make -C "$_name-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
