# Contributor: Dirk Langer <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-validate-domain'
pkgver='0.15'
pkgrel='2'
pkgdesc="Domain and host name validation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-domain-tld>=1.74')
makedepends=()
checkdepends=('perl-test-simple>=1.302200')
url='https://metacpan.org/release/Data-Validate-Domain'
source=("http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Data-Validate-Domain-$pkgver.tar.gz")
md5sums=('451840424e781e00ccbbe194fa5733bd')
sha512sums=('76cfae536841e69f3694f2cf88321718ffbafa0376faec6763f295650c67e550c90c640a444616482acf7175337a646f80938255eeb32204f827a891a91d0195')
_distdir="Data-Validate-Domain-$pkgver"

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
