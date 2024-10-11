# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-chemistry-mol'
pkgver='0.39'
pkgrel='1'
pkgdesc="Molecule object toolkit"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0' 'perl-io-string>=0' 'perl-math-vectorreal>=1.0')
makedepends=()
url='https://metacpan.org/release/Chemistry-Mol'
source=('http://search.cpan.org/CPAN/authors/id/M/ME/MERKYS/Chemistry-Mol-0.39.tar.gz')
md5sums=('7824e55c3fb76c33addd81d61d6bd47e')
sha512sums=('61d413c3a55f263da73f3dc3349fc3042f1906bea2294998ada176f2cd2b49d808bc442459a0a2b6ab203c8958e808a7ca3a8c90fa1be6a2ea437631df07a51d')
_distdir="Chemistry-Mol-0.39"

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
