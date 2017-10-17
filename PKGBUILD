# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-mockrandom'
pkgver='1.01'
pkgrel='1'
pkgdesc="Perl/CPAN Module Test::MockRandom: Replaces random number generation with non-random number generation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Test-MockRandom'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Test-MockRandom-$pkgver.tar.gz")
md5sums=('5ea7e2ec70776129993721f7632d04da')
sha512sums=('e222bd0d3d7673b403e80d1633ddaca0ee35f96f2245e8df859d661edc7efc09b9a96d3718f25b6614395d1f24d66c9498e842cec476cf8c5b12464d585f85e7')
_distdir="Test-MockRandom-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
