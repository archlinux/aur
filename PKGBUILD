# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-parse-http-useragent'
pkgver='0.35'
pkgrel='1'
pkgdesc="Parser for the User Agent string"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Parse-HTTP-UserAgent'
source=('http://search.cpan.org/CPAN/authors/id/B/BU/BURAK/Parse-HTTP-UserAgent-0.35.tar.gz')
md5sums=('6063593a9d2fdc098f37d645f525e0ab')
sha512sums=('cb46b790869386493cd3744829ae5b9a7c51d9fe89a00968f3b9afd1d9adb3f44980efcccfac17315eed8d43ceb9ccbb5207306bad62f27eb1fc4d46b5680b55')
_distdir="Parse-HTTP-UserAgent-0.35"

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
