# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-fetch'
pkgver='0.29'
pkgrel='1'
pkgdesc="HTTP/3, HTTP/2 and HTTP/1.1 Future-based user agent"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('libnghttp2>=1.70.0' 'libnghttp3>=1.18.0' 'libngtcp2>=1.25.0' 'libngtcp2>=1.25.0' 'liburing>=2.15' 'openssl>=4.1.0' 'openssl>=4.1.0' 'perl>=5.8.3' 'perl-file-raw-json>=0.05')
makedepends=()
url='https://metacpan.org/release/Fetch'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Fetch-$pkgver.tar.gz")
md5sums=('c89808c48da15fb4764bfb85b78a0a15')
sha512sums=('233f048f6975623fc868380e7b0ce2d82ebed89303edf42263c4fa2a43ad9a56e7660157152e522ef32b26b3a5a809b363c7106630bd2bb539b020be6b73cdaf')
_distdir="Fetch-$pkgver"

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
