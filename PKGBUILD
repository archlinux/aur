# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-parse-ansicolor-tiny'
pkgver='0.700'
pkgrel='1'
pkgdesc="Perl/CPAN Module Parse::ANSIColor::Tiny: Determine attributes of ANSI-Colored string"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
checkdepends=('perl-test-differences' 'perl-test-requires')
url='https://metacpan.org/release/Parse-ANSIColor-Tiny'
source=("http://search.cpan.org/CPAN/authors/id/R/RW/RWSTAUNER/Parse-ANSIColor-Tiny-$pkgver.tar.gz")
md5sums=('fc2c7aeadcbbfb755b3bb1db24e807b2')
sha512sums=('39cc4c4a9401dde3e7133df79eccf1b8e9af444711642b037a29f0d4806838f3cf2924f008d53cd2a21336e401c75b894ef9b583f2c1694ea6835ba00aacfaa5')
_distdir="Parse-ANSIColor-Tiny-$pkgver"

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
