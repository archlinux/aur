# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-unaccent'
pkgver='1.08'
pkgrel='1'
pkgdesc="Remove accents from a string"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Text-Unaccent'
source=('http://search.cpan.org/CPAN/authors/id/L/LD/LDACHARY/Text-Unaccent-1.08.tar.gz')
md5sums=('9ac9b28cbb66f4829a50d563ace79cb5')
sha512sums=('d2c6a308904d0f1d5cd05a9fd29436f54292ea537f2ad8f44b4ebc0523302db64bb087aeac1f8e51c093e71b205c6c4fd9649cf2c8cbf8b50266c0aa200917c8')
_distdir="Text-Unaccent-1.08"

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
