# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-enumeration'
pkgver='0.010'
pkgrel='1'
pkgdesc="a native attribute trait for enums"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-runtime>=0' 'perl-moose>=1.15' 'perl-match-simple>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-requires>=0.006')
url='https://metacpan.org/release/MooseX-Enumeration'
source=('https://cpan.metacpan.org/authors/id/T/TO/TOBYINK/MooseX-Enumeration-0.010.tar.gz')
md5sums=('764adead9ade84234828598a5d5a2446')
sha512sums=('66ac7d0d0ad8196d259d4b5c5e160021a4507021eb6dfcf565e52e04c808b3d3a9a2f6c1a16b7aafb8bdcb2449412891dae4f193c703e98a0ac62591f34fabdd')
_distdir="MooseX-Enumeration-0.010"

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
