# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-struct-codec'
pkgver='0.10'
pkgrel='1'
pkgdesc="a Perl structure to bytes and back, with nothing lost"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Struct-Codec'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Struct-Codec-$pkgver.tar.gz")
md5sums=('0f70f6e27e33c00fb9781245d178890d')
sha512sums=('d6b0c4ba48d6200fc9a33f2c164036602b721ec0e67e7680c2267447bcfe9876089b39571a3c4a180803e5ac7da8e72485a59ffc582abfb69ba61902bbc2a28e')
_distdir="Struct-Codec-$pkgver"

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
