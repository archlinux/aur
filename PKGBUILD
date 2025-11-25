# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-dom58'
pkgver='3.002'
pkgrel='1'
pkgdesc="Minimalistic HTML/XML DOM parser with CSS selectors"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Mojo-DOM58'
source=("http://search.cpan.org/CPAN/authors/id/D/DB/DBOOK/Mojo-DOM58-$pkgver.tar.gz")
md5sums=('09d7274dad04769e84f1116234d1b76c')
sha512sums=('57577366afd2b623b3d2bd50e86e29d632b03ee3ca1c10dda27b55c057170b15970847fde6b34d38591f5f856f8e1165cdc33ec0315a1bc5005b29cc8e382e14')
_distdir="Mojo-DOM58-$pkgver"

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
