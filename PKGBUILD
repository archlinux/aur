# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-eol'
pkgver='2.02'
pkgrel='2'
pkgdesc="Check the correct line endings in your project"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-EOL'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-EOL-${pkgver}.tar.gz")
md5sums=('5d22a042cc7dc92711fd4af833893826')
sha512sums=('03f3a60973fde1c0fb9532be957d981bad657fec4db1b77dca865011e1bf39dcbb91a8ee09cc692ab9b372a139371ba66b69c60ae582b687a6ec230fb58a9654')
_distdir="Test-EOL-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
