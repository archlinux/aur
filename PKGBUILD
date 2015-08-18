# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-text-csv'
pkgver='1.33'
pkgrel='1'
pkgdesc="comma-separated values manipulator (using XS or PurePerl)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
optdepends=('perl-text-csv-xs: XS Text::CSV')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Text-CSV'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAKAMAKA/Text-CSV-1.33.tar.gz')
md5sums=('358e2f2ddb6c7746c91e49a7db97b634')
sha512sums=('3b30242c71719aeb20077490b752718bb25320dc1510b5053d5e21678cf7011e16eac2b578138115399f8dbdfb5519cbb913fc42b042355e35e39491ed520b8e')
_distdir="Text-CSV-1.33"

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
