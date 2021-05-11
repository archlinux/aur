# Contributor: Salamandar <felix@piedallu.me>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-geometry-planar'
pkgver='1.18'
pkgrel='1'
pkgdesc="A collection of planar geometry functions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-math-geometry-planar-gpc>=1.04' 'perl-math-geometry-planar-offset>=1.03')
makedepends=()
url='https://metacpan.org/release/Math-Geometry-Planar'
source=('http://search.cpan.org/CPAN/authors/id/D/DV/DVDPOL/Math-Geometry-Planar-1.18-withoutworldwriteables.tar.gz')
md5sums=('97de25db76b3210408d36e396eb9ab20')
sha512sums=('cfe0540fb79a8974a64e9faf71bca0a1ce128830ef69de9f72ea8aa57b2a695da345bcef3c4b413152e06ed9970ef6c5fba39a764e65432372c679157dce58b0')
_distdir="Math-Geometry-Planar-1.18"

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
