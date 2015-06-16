# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-http-parser-xs'
pkgver='0.16'
pkgrel='1'
pkgdesc="a fast, primitive HTTP request parser"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/HTTP-Parser-XS'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/HTTP-Parser-XS-0.16.tar.gz')
md5sums=('df6fce8f94d0e58dc6161963c647269b')
sha512sums=('c0e9ebd886e63053375ec5ea4b222779a4f800a3bd30d47ce307b88ddfdf4fe71aa47544c0084ad8f9e7d66f04af2a1647e84a0f80f9740da125afeb3df806c0')
_distdir="HTTP-Parser-XS-0.16"

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
