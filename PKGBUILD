# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-zlib'
pkgver='1.15'
pkgrel='1'
pkgdesc="IO:: style interface to Compress::Zlib"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/IO-Zlib'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOMHUGHES/IO-Zlib-1.15.tar.gz')
md5sums=('be82e37ac2e2a621e0e146c4a642f869')
sha512sums=('479dbdd0ce05ea090f9bc7e555142173772066f18092bb7511e33066b49deb42dff44680067447220703ec1f055a4491a6d03f311f16de6fbbb5b5162e2717bd')
_distdir="IO-Zlib-1.15"

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
