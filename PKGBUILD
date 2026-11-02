# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-hyperman'
pkgver='0.66'
pkgrel='1'
pkgdesc="an event-loop PSGI server"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('libnghttp2>=1.70.0' 'libnghttp3>=1.18.0' 'libngtcp2>=1.25.0' 'libngtcp2>=1.25.0' 'liburing>=2.15' 'openssl>=4.1.0' 'openssl>=4.1.0' 'perl>=5.10.0' 'perl-frozen>=0.07' 'perl-plack>=0' 'perl-shared-arena>=0.12' 'zlib>=1:1.3.2')
makedepends=()
url='https://metacpan.org/release/Hyperman'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Hyperman-$pkgver.tar.gz")
md5sums=('5837c9aa3902c86a16d9d1ddc4d4b769')
sha512sums=('2a163002d478b21cac70ab8b6dac5db67470a7e9432382bd6ecaa4d82bbe6bb43ff361e1f79c76cd22d40fd071251f273e6065f5c5e2650b8e453ce4db53af06')
_distdir="Hyperman-$pkgver"

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
  export LANG=C
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

