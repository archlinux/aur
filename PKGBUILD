# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-pod-tests'
pkgver='1.19'
pkgrel='1'
pkgdesc="Extracts embedded tests and code examples from POD"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Pod-Tests'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Pod-Tests-1.19.tar.gz')
md5sums=('9c1a062bc7689e0c4f94784e3de69f35')
sha512sums=('fb48e912f33bc36b782eaf71797732358288840148bdf69ce3381038c47de31e2e111d16d47351c75169016a8a45dcfdfa6e290f61acc8d130fd6c4d0c7dfb9c')
_distdir="Pod-Tests-1.19"

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
