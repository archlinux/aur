# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-hide'
pkgver='0.0014'
pkgrel='1'
pkgdesc="Forces the unavailability of specified Perl modules (for testing)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
url='https://metacpan.org/release/Devel-Hide'
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/Devel-Hide-${pkgver}.tar.gz")
md5sums=('ddb8a7ef95a32df876e4131c50392610')
sha512sums=('395d2c9ca4090398f31a50fe4970b6c4349424c11eaac407c5d2860bdf95c7d00844be9333bd62671baa82e668f6589c5bf61e7da7f99a2a03385e2dfc23cd78')
_distdir="Devel-Hide-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
