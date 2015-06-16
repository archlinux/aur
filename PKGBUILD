# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-time'
pkgver='0.04'
pkgrel='1'
pkgdesc="Overrides the time() and sleep() core functions for testing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-name-fromline')
makedepends=()
url='http://search.cpan.org/dist/Test-Time'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SATOH/Test-Time-0.04.tar.gz')
md5sums=('006c4b2134f33d8dc98ecf545d4f8508')
sha512sums=('99d258d8257dd858eab5f95211c8bb2c071155c63ec6af577541f7446c75c39329d249e9fd43d9d688d7c30a104953aa0b3774aec9b3ffc0fd96d1947d844c24')
_distdir="Test-Time-0.04"

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
