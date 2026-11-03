# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-context-vars'
pkgver='0.05'
pkgrel='1'
pkgdesc="variables with context scope"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-hamt>=0.03' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Context-Vars'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Context-Vars-$pkgver.tar.gz")
md5sums=('e7eb720214e3517c84b7d506515a24d2')
sha512sums=('be555ea381dd95208a8c6122e650d2f1a2f3efc7fb88599d14934fe0bb2c377ac1c9695bfbc2a71a20d500a67ffa7b72f41b19b2e9d26dc3c0d0c31b8f209566')
_distdir="Context-Vars-$pkgver"

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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
