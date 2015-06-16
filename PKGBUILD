# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-data-stream-bulk'
pkgver='0.11'
pkgrel='1'
pkgdesc="N at a time iteration API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.90' 'perl-namespace-clean' 'perl-path-class' 'perl-sub-exporter')
makedepends=('perl-test-requires')
url='http://search.cpan.org/dist/Data-Stream-Bulk'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Data-Stream-Bulk-0.11.tar.gz')
md5sums=('f41f1efb87b754de8764a61cbf34fcd2')
sha512sums=('7c14e3e1e8d6d805aa6cedd6caec3f8e09cf30c196abd3661b3f6f12871212a808ad938ae24d13e4c1d7114ead912debf0f859d34cc42e70ef5e748dcc9242d2')
_distdir="Data-Stream-Bulk-0.11"

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
