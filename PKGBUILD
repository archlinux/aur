# Contributor: nous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-unicode-map8'
pkgver='0.13'
pkgrel='1'
pkgdesc="Mapping table between 8-bit chars and Unicode"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-unicode-string>=2')
makedepends=()
url='https://metacpan.org/release/Unicode-Map8'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Unicode-Map8-0.13.tar.gz')
md5sums=('fc93a37cabcae488bd95ca07bf5c919e')
sha512sums=('1e8db5bb1e10f13da4eb2c5de36d38e1cad5eeed2aba7e6bfcfb36cde727d557902ac476f64d28937ff2a53992c67f027d1a42edb005292d1c2ec89d05e18f2a')
_distdir="Unicode-Map8-0.13"

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
