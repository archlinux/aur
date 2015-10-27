# CPAN Name  : Test-MockTime
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-mocktime'
pkgver='0.15'
pkgrel='1'
pkgdesc="Replaces actual time with simulated time "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Test-MockTime'
source=('http://search.cpan.org/CPAN/authors/id/D/DD/DDICK/Test-MockTime-0.15.tar.gz')
md5sums=('af7374d01a2d6a0a9a341543ab8619e1')
sha512sums=('8a91eb39e7ff68d6ac1cbd149ee8acdbdc2bf6c99bcd71decc38fb2c71f5ed6bdb32336c4e07a922e7d8dd1b2d084306a232e008a0a8587720fff60a3ba325d0')
_distdir="Test-MockTime-0.15"

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
