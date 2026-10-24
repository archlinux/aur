# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-date-holidays-de'
pkgver='2.07'
pkgrel='1'
pkgdesc="Determine German holidays"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-date-calc>=5')
makedepends=()
url='https://metacpan.org/release/Date-Holidays-DE'
source=("http://search.cpan.org/CPAN/authors/id/F/FR/FROGGS/Date-Holidays-DE-$pkgver.tar.gz")
md5sums=('2981433823786dcb37195f2f9a611c33')
sha512sums=('34012d8d9a6bf27c68508637f2c83c8f3e0890d34dc0633552f8593d20c2140adac6432bdc8c71151a49f78cdff195211130cae46e0d35660095bbdf6e621cc4')
_distdir="Date-Holidays-DE-$pkgver"

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
