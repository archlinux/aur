# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-chi-driver-berkeleydb'
pkgver='0.03'
pkgrel='1'
pkgdesc="Using BerkeleyDB for cache"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-berkeleydb>=0.30' 'perl-chi>=0.25')
makedepends=('perl-test-class' 'perl-test-most')
url='http://search.cpan.org/dist/CHI-Driver-BerkeleyDB'
source=('http://search.cpan.org/CPAN/authors/id/J/JS/JSWARTZ/CHI-Driver-BerkeleyDB-0.03.tar.gz')
md5sums=('9afd8c2bd0df14ca81bc5fedd827ae62')
sha512sums=('6cebf9ded4c65b7bda44826cd50872662a7f3980daf635ac31627658914dccc6bc8af95037b44695a65de156bc565c5a9814f4f635ee96bf4c18b520ec12e1b0')
_distdir="CHI-Driver-BerkeleyDB-0.03"

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
