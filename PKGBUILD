# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-needsdisplay'
pkgver='1.07'
pkgrel='1'
pkgdesc="Ensure that tests needing a display have one"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0')
makedepends=()
url='https://metacpan.org/release/Test-NeedsDisplay'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Test-NeedsDisplay-1.07.tar.gz')
md5sums=('9c6058e44f23696567cce3e14641a0af')
sha512sums=('257a41fe332049721994cd00a9cdeb39d340a6d45eaecda4e831ddcb05577d96e013f4632af86b4c0d6192773cea1f6a2d5146964f0e7fe16a039aea4bdf66a9')
_distdir="Test-NeedsDisplay-1.07"

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
