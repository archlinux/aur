# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mousex-types'
pkgver='0.06'
pkgrel='5'
pkgdesc="Organize your Mouse types in libraries"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-any-moose>=0.15' 'perl-mouse>=0.77' 'perl>=5.6.2')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/MouseX-Types'
source=("http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/MouseX-Types-$pkgver.tar.gz")
md5sums=('83a7fb907b2f536d18dc9ddac99f87ab')
sha512sums=('5e64f3ff014ae3c9c4edb7da4670995e0efc6f3dcd868c18db143d740a1bc4cc76fd290f15a673c11c6b706da77ad8ba40e1d64fbfa55c0916a2cd1498583d50')
_distdir="MouseX-Types-$pkgver"

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
