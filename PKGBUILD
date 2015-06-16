# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cache-berkeleydb'
pkgver='0.03'
pkgrel='1'
pkgdesc="implements the Cache::Cache interface."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-berkeleydb>=0.21' 'perl-cache-cache>=1.00')
makedepends=()
url='http://search.cpan.org/dist/Cache-BerkeleyDB'
source=('http://search.cpan.org/CPAN/authors/id/B/BA/BALDUR/Cache-BerkeleyDB-0.03.tar.gz')
md5sums=('ae7dd7aeb1e2cd8142dbbc554dc62a4e')
sha512sums=('be86c9b3fac0dbb19c9c4d26b41fe9e068ed39924e8234d81b906660ef8cb492d5f116738058d5d4cac93129eff4f6910e6c9a0cc60d5deaabe1e81f5f01b20a')
_distdir="Cache-BerkeleyDB-0.03"

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
