# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-corelist'
pkgver='2.94'
pkgrel='1'
pkgdesc="what modules shipped with versions of perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Module-CoreList'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Module-CoreList-2.94.tar.gz')
md5sums=('5ae59b3e0d088134d5894ee74162655d')
sha512sums=('6016dab517a5f11f7d41833ab7e4d37a16b2a0fdb9f23af185ad1d84de524bb81b41b12ece22b4e854047be29e1c84fde7554b8bd8cdfaf74201688d98e51265')
_distdir="Module-CoreList-2.94"

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
