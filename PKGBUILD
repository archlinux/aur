# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=cstools
pkgver=3.42
pkgrel=2
pkgdesc="Tools for dealing with Czech texts in Perl."
arch=('i686' 'x86_64')
url="http://www.fi.muni.cz/~adelton/perl/#cstools"
license=('unknown')
depends=('perl')
source=(http://www.fi.muni.cz/~adelton/perl/Cstools-$pkgver.tar.gz)

md5sums=('ea18f2a24ef5de92483a5e03ed9d2659')

build() {
  cd "${srcdir}/Cstools-$pkgver"
  install -d ${srcdir}/build
  cp -rf ${srcdir}/Cstools-$pkgver/* ${srcdir}/build/

  cd ${srcdir}/build
  perl Makefile.PL || return 1
  make || return 1
  make test || return 1
  make DESTDIR=${pkgdir} install || return 1
}
