# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-builder'
pkgver='0.018'
pkgrel='1'
pkgdesc="An overview of the foundations of the ExtUtils::Builder Plan framework"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-extutils-config>=0' 'perl-extutils-helpers>=0.027' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/ExtUtils-Builder'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Builder-$pkgver.tar.gz")
md5sums=('73416f09432d80a1596c637eec2731b0')
sha512sums=('88fc4757625be083e1bb0c2c1c22e6013e81c069258a8eb5e8c2665a5f52019be3b5367c6d8847d75cf54949e40a4c2ed65284b02e9153a1a62026efbd63a8ca')
_distdir="ExtUtils-Builder-$pkgver"

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
