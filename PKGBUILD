# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-module-path'
pkgver='0.12'
pkgrel='1'
pkgdesc="get the full path to a locally installed module"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=('perl-devel-findperl>=0')
url='http://search.cpan.org/dist/Module-Path'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Module-Path-0.12.tar.gz')
md5sums=('f9a8b2b4b203213ef5be464fa75b0927')
sha512sums=('841309a89c042964e56eb98a4a02109175b6fc791808c6fe0a8daba3f5f2682ca772f8099ebdd4d2aba5bc8ee265d7c9ca256e7aa4ed6e6ec8100db1d3d09d84')
_distdir="Module-Path-0.12"

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
