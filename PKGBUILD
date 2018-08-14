# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-string-format
pkgver=1.18
pkgrel=1
pkgdesc="sprintf-like string formatting capabilities with"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/String-Format'
source=('https://cpan.metacpan.org/authors/id/S/SR/SREZIC/String-Format-1.18.tar.gz')
md5sums=('64174b4fac230228cadfa2be4410ef1a')
sha512sums=('34eb3991a9bea931f59ca1683ba72d8b07244ed4c2a9409be0626346526b4eb2ab07acdd5c4eabf44a767867a4991e97d89835eb0e4c3c43b413de75eb3c0d5d')
_distdir="String-Format-1.18"

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
