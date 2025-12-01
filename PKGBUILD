# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-kwalify'
pkgver='1.24'
pkgrel='1'
pkgdesc="Kwalify schema for data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Kwalify'
source=('https://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/Kwalify-1.24.tar.gz')
md5sums=('f185547115888ebbba6e3842631e50c3')
sha512sums=('879ddf0cdb02034a5b41968cc095fbc04762d535700d24ac0a5fddf52556f9c9e087044491eebc610d0ab1776cbb0f1b6a971e2770288d77fea0fe1e8f5fb41e')
b2sums=('4c78aae2eea423cbd8bc9869d4a8232dcbbd0f9945ce44063639ce77741001cc4cec8211dfa28542cf8d021d369c7972d3a4de847bad87807fcb9d74db516c5c')
_distdir="Kwalify-1.24"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
