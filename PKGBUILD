# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-builder'
pkgver='0.017'
pkgrel='2'
pkgdesc="An overview of the foundations of the ExtUtils::Builder Plan framework"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-extutils-config>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/ExtUtils-Builder'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Builder-$pkgver.tar.gz")
md5sums=('d2f6bbec86bd4686104347924fd29e7a')
sha512sums=('b430726b6b93461ee486c98bfa118ad79b5c3ca3d74f4e217c4d3f3d36b63e4802ea38fd7349213d90370914ef89dcfa8d2fa45a2d0182bc33d1f7cc77c9289e')
_distdir="ExtUtils-Builder-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
