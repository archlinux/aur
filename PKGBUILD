# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-assertions'
pkgver='1.054'
pkgrel='1'
pkgdesc="a simple set of building blocks for both unit and runtime testing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-trace')
makedepends=()
url='http://search.cpan.org/dist/Test-Assertions'
source=('http://search.cpan.org/CPAN/authors/id/B/BB/BBC/Test-Assertions-1.054.tar.gz')
md5sums=('71359868674fd4290bd7d9da407c1cda')
sha512sums=('79b24ce95e9425240d1d1bb969e93bcce8f6423e87bdf011a2bbd3073daa6762b775dcd8b3b9851d873508868c7cc7cf227036004f71150340e43845456eb398')
_distdir="Test-Assertions-1.054"

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
