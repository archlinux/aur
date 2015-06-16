# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-parse-plainconfig'
pkgver='2.06'
pkgrel='1'
pkgdesc="Parser/Generator of human-readable conf files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-paranoid')
makedepends=()
url='http://search.cpan.org/dist/Parse-PlainConfig'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CORLISS/Parse-PlainConfig/Parse-PlainConfig-2.06.tar.gz')
md5sums=('0c6ba58e095dbc3183162d805abf9973')
sha512sums=('0592b3bc79d1bdbd65b22d62443362f07131e54a5223e3043c63c68482c46051f6330b8d32ad38a917d1ccd21a5002651b8d50f425bc27297d6db7e1a5d2df57')
_distdir="Parse-PlainConfig-2.06"

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
