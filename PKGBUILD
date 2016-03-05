# Contributor: Mark Coolen <mark.coolen (at) gmail (dot) com>
# Maintainer: Sergio Tridente <tioduke (at) gmail (dot) com>

pkgname=writerperfect
pkgver=0.9.5
pkgrel=1
pkgdesc="libwpd utilities for converting WordPerfect(tm) and Visio(tm) documents to odt and odg"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libwpd"
license=('LGPL')
depends=('libodfgen' 'librevenge' 'libwpd' 'libwpg' 'libvisio')
makedepends=('boost' 'glibc' 'libtool')
optdepends=('libabw' 'libcdr' 'libe-book' 'libepubgen' 'libfreehand' 'libgsf' 'libmspub' 'libpagemaker')
source=(http://downloads.sourceforge.net/project/libwpd/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('916e86f7005b441399cf8e62fbde5650')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --disable-werror
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
