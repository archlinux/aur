# Contributor: Thor77 <thor77 at thor77 dot org>

pkgname=perl-ogg-vorbis-header-pureperl
pkgver=1.05
pkgrel=3
pkgdesc='Perl/CPAN module Ogg::Vorbis::Header::PurePerl - An object-oriented interface to Ogg Vorbis info and comments'
_dist=Ogg-Vorbis-Header-PurePerl
arch=(any)
url="https://metacpan.org/release/$_dist"
license=(GPL-2.0-or-later)
depends=(perl)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/D/DA/DAVECROSS/$_dist-$pkgver.tar.gz")
sha256sums=('521d3808f42d7122a6b06c33a6eae6d7c39947aab57c4c8ccafcc4f603fda53e')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

