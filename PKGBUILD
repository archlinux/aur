# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=perl-ogg-vorbis-header-pureperl
pkgver=1.0
pkgrel=1
pkgdesc="Perl/CPAN module Ogg::Vorbis::Header::PurePerl - An object-oriented interface to Ogg Vorbis info and comments"
arch=(any)
license=(GPL)
url="http://search.cpan.org/~daniel/Ogg-Vorbis-Header-PurePerl-$pkgver/PurePerl.pm"
options=(!emptydirs purge)
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DANIEL/Ogg-Vorbis-Header-PurePerl-$pkgver.tar.gz)
md5sums=('1b09cefefd4a83bd4a53d2fddbd0bc68')

package() {
  cd "${srcdir}/Ogg-Vorbis-Header-PurePerl-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${pkgdir} || return 1

}