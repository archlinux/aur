# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-collection'
pkgver='0.58'
pkgrel='1'
pkgdesc="CRUD framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-flow>=0.6' 'perl-json-xs>=2.29' 'perl-string-crc32>=1.4')
makedepends=()
url='http://search.cpan.org/dist/Collection'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZA/ZAG/Collection-0.58.tar.gz')
md5sums=('f2f5adb24a9b3f21ba32c0223c43f2f8')
sha512sums=('bb5b22a2f5f8d991f0e80db139a6effe8f32ec745d8dc854d5a3b46172a8f2fff8c49ddbccb5c4b2920bba1d948a7dbfb790d6471d879c7fbd7657e04b0ef2cd')
_distdir="Collection-0.58"

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
