# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-plack-middleware-removeredundantbody'
pkgver='0.03'
pkgrel='1'
pkgdesc="Plack::Middleware which sets removes body for HTTP response if it's not required"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-always>=0' 'perl-http-message>=0' 'perl-plack>=0')
makedepends=()
url='http://search.cpan.org/dist/Plack-Middleware-RemoveRedundantBody'
source=('http://search.cpan.org/CPAN/authors/id/S/SW/SWEETKID/Plack-Middleware-RemoveRedundantBody-0.03.tar.gz')
md5sums=('7c2abc8da66222bbcf82360310bd1665')
sha512sums=('8f2b0218094c8596f2ecea665023b98b65cc1a488a62056f1e22c36ead4367ba438228a32ee30eb37409bb3b375be92082b1a20410e27a8fed18ef898fc6322a')
_distdir="Plack-Middleware-RemoveRedundantBody-0.03"

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
