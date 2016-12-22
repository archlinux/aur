# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cpanel-json-xs'
pkgver='3.0225'
pkgrel='1'
pkgdesc="cPanel fork of JSON::XS, fast and correct serializing"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Cpanel-JSON-XS'
source=('http://search.cpan.org/CPAN/authors/id/R/RU/RURBAN/Cpanel-JSON-XS-3.0225.tar.gz')
md5sums=('6be52ff9c55adcb531a464291aad4bd3')
sha512sums=('5e43c6116cc0b59c6bfabcc7a701c19ca1a29749aa9df299fa3cd6a55b3672353e995dc896f9f716880bfaa078a0ba1617c5c3d8f70ecdf02c8d4aa297caf0c6')
_distdir="Cpanel-JSON-XS-3.0225"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
