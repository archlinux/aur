# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-parallel-scoreboard'
pkgver='0.08'
pkgrel='1'
pkgdesc="a scoreboard for monitoring status of many workers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-lite' 'perl-html-parser' 'perl-json')
makedepends=()
url='http://search.cpan.org/dist/Parallel-Scoreboard'
_tarname="Parallel-Scoreboard-${pkgver}"
source=("http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/${_tarname}.tar.gz")
b2sums=('c923e6d56f09a689540c9884d256f3ca054aeb1ed50fd7490ea636859fec31aefeaf4f8e565970594901c2c29ad4a238fba6ee221a72d738ab33502c85ea313e')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_tarname"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_tarname"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_tarname"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
