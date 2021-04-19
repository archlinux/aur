# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-date-easter'
pkgver='1.22'
pkgrel='1'
pkgdesc="Calculates Easter for any given year"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/pod/Date::Easter'
source=("https://cpan.metacpan.org/authors/id/R/RB/RBOW/Date-Easter-$pkgver.tar.gz")
md5sums=('05030e2943f4daf99d7715e80b9e3cfc')
sha512sums=('60a4f43c94ed250ce4d21f397566aacd46e6a4bfbfad47e1587bdd3924f59c436e3d1a6248ac246d909df1854d27a0198d08fa96562f8d790baea8a9ffc20e18')
_distdir="Date-Easter-$pkgver"

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
