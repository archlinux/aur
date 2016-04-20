# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-fvwmpiazza'
pkgver='0.3001'
pkgrel='1'
pkgdesc="Fvwm module for tiling windows"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('fvwm' 'perl-class-base' 'perl-yaml-syck')
makedepends=()
url='http://search.mcpan.org/dist/FvwmPiazza'
source=('http://search.cpan.org/CPAN/authors/id/R/RU/RUBYKAT/FvwmPiazza-0.3001.tar.gz')
md5sums=('0afdfbbbb0f41acc4d2967238c9e9ca0')
sha512sums=('3a3ef0a18a6fbcd498be1c6a41b7d22f691be0f43cd8a53781d00b12d60dffb33b5ec4187909062d59b5e3a1819f2c794f60ebe08d78e95a4aa84768578c8abf')
_distdir="FvwmPiazza-0.3001"

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
