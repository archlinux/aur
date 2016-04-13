# Maintainer: Sebastian Ziebarth <mauspacker@posteo.de>
_author=DORMANDO
_perlmod=MogileFS-Utils
pkgname=mogilefs-utils
pkgver=2.29
pkgrel=1
pkgdesc="Command line utilities for the MogileFS distributed file system"
arch=(any)
url="http://www.mogilefs.org/"
license=('GPL' 'PerlArtistic')
depends=(perl-mogilefs-client perl-dbi)
options=('!emptydirs')
source=(http://cpan.perl.org/modules/by-authors/id/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('093aee5dc57a3f0a50651072e2de571d')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
