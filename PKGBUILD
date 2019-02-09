# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-algorithm-loops'
pkgver='1.032'
pkgrel='1'
pkgdesc="Algorithm::Loops - looping constructs: NestedLoops, MapCar*, Filter, and NextPermute*"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/pod/Algorithm::Loops'
source=("https://cpan.metacpan.org/authors/id/T/TY/TYEMQ/Algorithm-Loops-${pkgver}.tar.gz")
md5sums=('ef1150b4967e9bd17fce77efed7b67f9')
sha512sums=('a79bcda2a7935be36de043c3458d2f816c595a0dfcb1268be155471a36c0be1a95e765ba0e6a40022ebcd85acc84ff1c53c7f34fd1d7c3410d8d13686405d523')
_distdir="Algorithm-Loops-${pkgver}"

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
  rm -r "$pkgdir"/usr/lib
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
