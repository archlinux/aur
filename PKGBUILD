# Contributor: Mark Coolen <mark.coolen (at) gmail (dot) com>
# Maintainer: Sergio Tridente <tioduke (at) gmail (dot) com>

pkgname=writerperfect
pkgver=0.9.6
pkgrel=4
pkgdesc="libwpd utilities for converting WordPerfect(tm) and Visio(tm) documents to odt and odg"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libwpd"
license=('LGPL')
depends=('libepubgen' 'libetonyek' 'libmwaw' 'libodfgen' 'libstaroffice' 'libvisio' 'libwps' 'libzmf')
optdepends=('libabw' 'libcdr' 'libe-book' 'libfreehand' 'libmspub' 'libpagemaker')
makedepends=('boost' 'glibc' 'libtool' 'libabw' 'libcdr' 'libe-book' 'libfreehand' 'libmspub' 'libpagemaker')
source=(http://downloads.sourceforge.net/project/libwpd/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('8807a94e844f56018179bcf21e1d391e')

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
