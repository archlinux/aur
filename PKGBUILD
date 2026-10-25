# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-dom58'
pkgver='3.003'
pkgrel='1'
pkgdesc="Minimalistic HTML/XML DOM parser with CSS selectors"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Mojo-DOM58'
source=("http://search.cpan.org/CPAN/authors/id/D/DB/DBOOK/Mojo-DOM58-$pkgver.tar.gz")
md5sums=('f14c442d63533bbc329a1d8818eab95e')
sha512sums=('df36e0ceb416cc75523e3b28427cea59e2f28bcdf10447bcb50d939e1a035c4cd654930932096ec2e4002582d1eb2a926618941a2e21b1278b8664c312a57a05')
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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
