# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-xml-catalog'
pkgver='1.03'
pkgrel='1'
pkgdesc="Resolve public identifiers and remap system identifiers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri' 'perl-xml-parser' 'perl-libwww')
makedepends=()
url='http://search.mcpan.org/dist/XML-Catalog'
source=('http://search.mcpan.org/CPAN/authors/id/J/JF/JFEARN/XML-Catalog-1.03.tar.gz')
md5sums=('c2c14f3e87aa75ebb7130ea4ebd41984')
sha512sums=('a6189b4e5d53c2a764643f0e83d2aac5139d97c98ce322c305f9adb4e064d1b388583711f4e70110d7c2974162db72a20ba7f235af3fb05178080a3f37983f1f')
_distdir="XML-Catalog-1.03"

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
