# Contributor: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbd-mock'
pkgver='1.45'
pkgrel='1'
pkgdesc="Perl/CPAN Module DBD::Mock: Mock database driver for testing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=1.3')
makedepends=()
checkdepends=('perl-test-exception>=0.31')
url='https://metacpan.org/release/DBD-Mock'
source=('http://search.cpan.org/CPAN/authors/id/D/DI/DICHI/DBD-Mock/DBD-Mock-1.45.tar.gz')
md5sums=('797dcee0e98e7459cad786ab908fcab9')
sha512sums=('f8dcc9bca52ad93ca223049f1576668b73b1150c55e22121c22b5e166114ab48f8781e8b648222d1ce0896cf21c973123ee30563855b92f553e9a90e54c40eec')
_distdir="DBD-Mock-1.45"

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
