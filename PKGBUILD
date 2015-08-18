# CPAN Name  : Test-MockTime
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-mocktime'
pkgver='0.13'
pkgrel='1'
pkgdesc="Replaces actual time with simulated time "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Test-MockTime'
source=('http://search.cpan.org/CPAN/authors/id/D/DD/DDICK/Test-MockTime-0.13.tar.gz')
md5sums=('937bc5ccb151e90b7749fc83c1680e70')
sha512sums=('0918a1c75c14eca44e6d44674973bd93d01b536dfebae666d4aae6ccf280ca91c7d8347319573a86d00555c9efd9cf38bbab41512bd79122666fc10b1b0d121b')
_distdir="Test-MockTime-0.13"

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
