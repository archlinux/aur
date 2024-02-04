# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=gnuastro
pkgver=0.22
pkgrel=1
pkgdesc='Various programs and library functions for the manipulation and analysis of astronomical data'
arch=('x86_64')
license=('GPL3')
depends=('gsl' 'wcslib' 'libgit2' 'ghostscript' 'libjpeg')
optdepends=('ds9: for astscript-fits-view')
url='https://www.gnu.org/software/gnuastro/'
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('fdbb134cd35974b13fab9c37353a3a0e')

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
