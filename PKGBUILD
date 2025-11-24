# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-chemistry-mol'
pkgver='0.40'
pkgrel='1'
pkgdesc="Molecule object toolkit"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-string' 'perl-math-vectorreal>=1.0' 'perl-set-object')
makedepends=()
checkdepends=('perl-clone')
url='https://metacpan.org/release/Chemistry-Mol'
source=('http://search.cpan.org/CPAN/authors/id/M/ME/MERKYS/Chemistry-Mol-0.40.tar.gz')
md5sums=('93a0854c884e43d29b34cf29b6e02990')
sha512sums=('31d89c533f0deff4b32a221ed1de69a956822ce6736d015dcb484fae98c3e04d61217e35cc1a64755d66ae0d3d8fec59db5889ae1162a9aab997e2ab1ff5d66d')
_distdir="Chemistry-Mol-0.40"

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
