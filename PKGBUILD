# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-socket-getaddrinfo'
pkgver='0.22'
pkgrel='1'
pkgdesc="address-family independent name resolving functions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-cchecker>=0.06')
url='http://search.cpan.org/dist/Socket-GetAddrInfo'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Socket-GetAddrInfo-0.22.tar.gz')
md5sums=('54c0d3a08757a1eeb118c1a5f54f6e1b')
sha512sums=('3117ad5931dd116f45afa041b7aad4506382c4359b67e61564affba6f34fe14db5dbe0dc0a1bf4c0b680847bda58958604907ff0339d500728b44301cf1fe554')
_distdir="Socket-GetAddrInfo-0.22"

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
