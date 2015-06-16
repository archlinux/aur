# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-catalyst-component-accept-context'
pkgver='0.07'
pkgrel='1'
pkgdesc="Make the current Catalyst"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=0' 'perl-mro-compat>=0')
makedepends=('perl-devel-cycle>=0')
url='http://search.cpan.org/dist/Catalyst-Component-ACCEPT_CONTEXT'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Component-ACCEPT_CONTEXT-0.07.tar.gz')
md5sums=('2c1036f67b40596741a4a5ffffd487ac')
sha512sums=('06c046844795b26f3d0eae0f5f9621adf010b7015f36af5ac699af3d5f065bf34481a290c1ce2a25c569aed2278128c815861dd3b09793c2b92fc71af605d371')
_distdir="Catalyst-Component-ACCEPT_CONTEXT-0.07"

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
