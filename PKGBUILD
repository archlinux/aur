# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-lazierattributes'
pkgver='1.07011'
pkgrel='1'
pkgdesc="Lazier Attributes."
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-clone>=0.39' 'perl-moox-returnmodifiers>=1.000001' 'perl-namespace-clean>=0.27' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-requires>=0')
url='https://metacpan.org/release/MooX-LazierAttributes'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/MooX-LazierAttributes-$pkgver.tar.gz")
md5sums=('92dfa87b07411ee1c84d21c8ab733b9a')
sha512sums=('f4c16ec481d4eb801a5ae0da471f26ab152963523da256d2d72b0e4371785c76a59929a71af1d201da999910f134dede07951eb5f0547a47cfbfa6dc46ac2893')
_distdir="MooX-LazierAttributes-$pkgver"

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
