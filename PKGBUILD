# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-apache-dbi'
pkgver='1.12'
pkgrel='1'
pkgdesc="Initiate a persistent database connection"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=1' 'perl-digest-sha1>=2.01')
makedepends=()
url='http://search.cpan.org/dist/Apache-DBI'
source=('http://search.cpan.org/CPAN/authors/id/P/PH/PHRED/Apache-DBI-1.12.tar.gz')
md5sums=('1bf6ca12b87de05bd53045325064636e')
sha512sums=('5b989856f7b6cb75a7a7a9b1ee8e166a1f5aa03475574d340933f135f813d55806f4bdf878faac49cb72a1b00f4ee23ddedb90909869771f4d613bbfd4ed135b')
_distdir="Apache-DBI-1.12"

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
