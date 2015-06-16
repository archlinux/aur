# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalystx-repl'
pkgver='0.04'
pkgrel='1'
pkgdesc="read-eval-print-loop for debugging your Catalyst application"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-repl' 'perl-catalyst-runtime' 'perl-namespace-autoclean')
makedepends=()
url='http://search.cpan.org/dist/CatalystX-REPL'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/CatalystX-REPL-0.04.tar.gz')
md5sums=('d1430f331366a491888b323f92413150')
sha512sums=('0728fb5b97a51ecd7c7794da44b9186252ae9b6da328da7cc3b86704dd4759c40e49f6720f2006ffa27112bdd620aed2467eaf43ea17dba358c88f1bcfd870d4')
_distdir="CatalystX-REPL-0.04"

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
