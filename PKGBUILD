# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-classattribute'
pkgver='0.29'
pkgrel='3'
pkgdesc="Declare class attributes Moose-style"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=2.00' 'perl-namespace-autoclean>=0.11' 'perl-namespace-clean>=0.20')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-requires>=0.05')
url='https://metacpan.org/release/MooseX-ClassAttribute'
source=('https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/MooseX-ClassAttribute-0.29.tar.gz')
md5sums=('f41b34190e5dc817f95342c590364895')
sha512sums=('517f85c78de45227382a6d0172eb452aa2326ee72b78f2984c53fb07649c3710158e3d25f1e3e1c6a4ae3de1e4cd2f4b3a143bc8f09c4cf35944e502b759eac3')
_distdir="MooseX-ClassAttribute-0.29"

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
