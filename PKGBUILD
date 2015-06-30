# Maintainer: Nick Hu <me@nickhu.co.uk>
pkgname=patchelfmod
pkgver=0.16
pkgrel=1
pkgdesc="A small utility to modify the dynamic linker and RPATH of ELF executables forked from the original"
arch=('i686' 'x86_64')
url="http://github.com/darealshinji/patchelfmod"
license=('GPL3')
depends=('gcc-libs')
source=(http://github.com/darealshinji/$pkgname/archive/$pkgver.tar.gz)
md5sums=('731f122d43665e321b7578a77da5be0a')

build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
