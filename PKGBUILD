# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-time-duration-parse'
pkgver='0.06'
pkgrel='1'
pkgdesc="Parse string that represents time duration"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-lite')
makedepends=('perl-time-duration')
url='http://search.cpan.org/dist/Time-Duration-Parse'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Time-Duration-Parse-0.06.tar.gz')
md5sums=('a23b7ca50a909df57e484cf39a3fa414')
sha512sums=('846eea74ce9b4882abb667ee92151b19ea8c4788631097b3a98fc621abc1bcb3f97f50a08f3346aa93cc4c0bd609afa848eae38194dc085061b4c82a818ccf55')
_distdir="Time-Duration-Parse-0.06"

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
