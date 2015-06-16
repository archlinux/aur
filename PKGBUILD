# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-fvwmpiazza'
pkgver='0.3'
pkgrel='1'
pkgdesc="Fvwm module for tiling windows"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-base' 'perl-yaml-syck')
makedepends=()
url='http://search.cpan.org/dist/FvwmPiazza'
source=('http://search.cpan.org/CPAN/authors/id/R/RU/RUBYKAT/FvwmPiazza-0.3.tar.gz')
md5sums=('75f99074e811227a510d09dc17d9c246')
sha512sums=('dfb4138a1c1664c9142d429b783f2ad2571ac7bf344b5bd21834a0c6de7eac4ca37de971713a73f3f2fc4337260c9ba369c07af350f00b7804b8c969a03b6a48')
_distdir="FvwmPiazza-0.3"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
