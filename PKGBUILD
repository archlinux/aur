# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-anyevent-dbi'
pkgver='2.3'
pkgrel='1'
pkgdesc="asynchronous DBI access"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=4.15' 'perl-common-sense>=3.3' 'perl-dbi>=1')
makedepends=()
url='http://search.cpan.org/dist/AnyEvent-DBI'
source=('http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/AnyEvent-DBI-2.3.tar.gz')
md5sums=('2644ddcaee033bd40de1fef61560fec9')
sha512sums=('2992ccd4bff5e2ffdb700cfff994067ea29c92f74b61c3429268d4204bdeb73e4d5477ce9b4ebff6a113fee13f89b3449f9f9fea16ed32c5baae1cc0b878fe5c')
_distdir="AnyEvent-DBI-2.3"

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
