# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-file-stat-bits'
pkgver='1.01'
pkgrel='1'
pkgdesc="stat(2) bit mask constants"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/File-Stat-Bits'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FEDOROV/File-Stat-Bits-1.01.tar.gz')
md5sums=('9c726b544895267e3e97f09e64793afe')
sha512sums=('8f9f22e4677baa9b996c0b6228bfd41cfa983b9a6581fc96473c2f3d3e0c79894f31ecb44cb2c371b45be2afcc08f71c9f40d1e15c2f6655b48ef208b33d1218')
_distdir="File-Stat-Bits-1.01"

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
