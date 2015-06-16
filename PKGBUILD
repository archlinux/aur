# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-mousex-foreign'
pkgver='0.008'
pkgrel='1'
pkgdesc="Extends non-Mouse classes as well as Mouse classes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mouse>=0.77' 'perl>=5.8.1')
makedepends=('perl-any-moose>=0.15')
checkdepends=('perl-test-exception>=0' 'perl-test-requires>=0')
url='http://search.cpan.org/dist/MouseX-Foreign'
source=('http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/MouseX-Foreign-0.008.tar.gz')
md5sums=('44ed5d7143d69dce4a2be02ef0cdd9a5')
sha512sums=('e5a7bb942accbe97bee5227d12e8ad898aa5772e5d492d9ea21cf44205b09e8aa93e997e7d131ce2009268ba44b2ff43e5dd028fbc9c0ee04977d6a02b512784')
_distdir="MouseX-Foreign-0.008"

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
