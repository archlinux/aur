# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-memory-cycle'
pkgver='1.04'
pkgrel='1'
pkgdesc="Verifies code hasn't left circular references"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-cycle>=1.07' 'perl-padwalker')
makedepends=()
url='http://search.cpan.org/dist/Test-Memory-Cycle'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/Test-Memory-Cycle-1.04.tar.gz')
md5sums=('0c51e09f6bc23676ca0112b1a95e129d')
sha512sums=('f3f55947ab9440b66062036ecc6e61206a114aaf46c39a38fb3cbe727ddbb374e80dc138a066c249ef17cfb227109a28d7a7608423037b39dd05b361b1a69155')
_distdir="Test-Memory-Cycle-1.04"

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
