# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-javascript-value-escape'
pkgver='0.06'
pkgrel='1'
pkgdesc="Avoid XSS with JavaScript value interpolation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='http://search.cpan.org/dist/JavaScript-Value-Escape'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/JavaScript-Value-Escape-0.06.tar.gz')
md5sums=('bff17ecb9fb5297b06693b4859fd4e0b')
sha512sums=('6fdf7c875a3fa08e036b2f8da4ca48efcc2a1aea8917eee8fd8909919da5b181017b46405b57ca0ffccc7e2aa32c0d40f0be59bd4a753cea617f3ba6408c992a')
_distdir="JavaScript-Value-Escape-0.06"

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
