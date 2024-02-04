# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-version'
pkgver='1.016'
pkgrel='1'
pkgdesc="Parse and manipulate Perl version strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Perl-Version'
source=('http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Perl-Version-1.016.tar.gz')
md5sums=('120078d8fe0946b86bf8374b911430f0')
sha512sums=('ef3668df9a0d84d392f63c16209e7cd49bba17f3e762cf46d11e395c0c212df547c808e8b8268f23a101cf3dfa09a3be72634058e878b0c55c32d522e5ace1f4')
_distdir="Perl-Version-1.016"

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
