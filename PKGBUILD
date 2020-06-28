# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbd-mock'
pkgver='1.55'
pkgrel='1'
pkgdesc="Perl/CPAN Module DBD::Mock: Mock database driver for testing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=1.3' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-exception>=0.31')
url='https://metacpan.org/release/DBD-Mock'
source=("http://search.cpan.org/CPAN/authors/id/J/JL/JLCOOPER/DBD-Mock-$pkgver.tar.gz")
md5sums=('5f2306abe44e82cb0d9a5e37d29a8bc9')
sha512sums=('70a85154e6295fccce275651e33a92275102d04ed1f733ad9ea13d7cb82cd17a0b5269ad92a8acc9e42a02e586c1db5f0145da88ed3a13b1baf06015e9bac751')
_distdir="DBD-Mock-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
