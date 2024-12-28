# Maintainer: envolution
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Doron Behar <doron.behar@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gnuastro
pkgver=0.23
pkgrel=1
pkgdesc='Programs and library functions for the manipulation and analysis of astronomical data'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gsl' 'wcslib' 'libgit2' 'ghostscript' 'libjpeg')
optdepends=('ds9: for astscript-fits-view')
url='https://www.gnu.org/software/gnuastro/'
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f22fd194f8c3d80645438f4b3906153e')

prepare() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc
}

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
