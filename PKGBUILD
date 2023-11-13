# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-geo-ipfree'
pkgver='1.160000'
pkgrel='1'
pkgdesc="Geo::IPfree - Look up the country of an IPv4 address"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
checkdepends=('perl-test2-plugin-nowarnings>=0' 'perl-test2-suite>=0' 'perl-test2-tools-explain>=0')
url='https://metacpan.org/release/Geo-IPfree'
source=('http://search.cpan.org/CPAN/authors/id/A/AT/ATOOMIC/Geo-IPfree-1.160000.tar.gz')
md5sums=('6784e81f27c579e8d1f670674137684b')
sha512sums=('7193d9c1895f99d41b4d15c1f11e8deeb729f4143eeb1a0b7aa8a2fe8e92e281c2208a5756f7d3da14983fd27fb9631e4cf897a967f04285e7b7394ca26d4945')
_distdir="Geo-IPfree-1.160000"

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
