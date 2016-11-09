# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-perlio-layers'
pkgver='0.011'
pkgrel='1'
pkgdesc="Querying your filehandle's capabilities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.3601' 'perl>=5.008_001')
makedepends=()
url='https://metacpan.org/release/PerlIO-Layers'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/PerlIO-Layers-0.011.tar.gz')
md5sums=('0ae26fbacfa77935ce0e7553ddca40f6')
sha512sums=('1c1a7a77c7e52d45c15015ecfee71d679acd98bb067a5d0147d6fe97fb35e40ab0a4dc3ecf1fb1b6ad8c599e9b765448e9dab5345c168552726ef9929d3bed81')
_distdir="PerlIO-Layers-0.011"

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
