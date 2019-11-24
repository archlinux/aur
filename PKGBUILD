# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-enumeration'
pkgver='0.009'
pkgrel='1'
pkgdesc="a native attribute trait for enums"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-runtime>=0' 'perl-moose>=1.15' 'perl-match-simple>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-requires>=0.006')
url='https://metacpan.org/release/MooseX-Enumeration'
source=('https://cpan.metacpan.org/authors/id/T/TO/TOBYINK/MooseX-Enumeration-0.009.tar.gz')
md5sums=('a6e27c2d6121ea5ce7b587f4e55bdb28')
sha512sums=('89dff673fd8a6734750d32251da53c2730071941903ff8a5c66c2286605bac92f56f04241ee32926af507fdcbbd473cba46cb03fa52223bb4a7f1a5fe06e719c')
_distdir="MooseX-Enumeration-0.009"

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
