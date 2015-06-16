# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-mojolicious-plugin-toto'
pkgver='0.25'
pkgrel='1'
pkgdesc="A simple tab and object based site structure"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=3.84')
makedepends=()
url='http://search.cpan.org/dist/Mojolicious-Plugin-Toto'
source=('http://search.cpan.org/CPAN/authors/id/B/BD/BDUGGAN/Mojolicious-Plugin-Toto-0.25.tar.gz')
md5sums=('49f7ca0dd48bf4b0693f66fdc5364e04')
sha512sums=('b227f63e4b411a6cc2d3b60b3a626e5789eef367ddbc4dc2c1e9b011493da31e4e0a2ff2050edad474d73d6ff19f0db8ae4dcb9e01da92b00059ddbefb7b575b')
_distdir="Mojolicious-Plugin-Toto-0.25"

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
