# CPAN Name  : Net-RawIP
# Contributor: Anonymous

pkgname='perl-net-rawip'
pkgver='0.25'
pkgrel='4'
pkgdesc="Perl extension to manipulate raw IP packets with interface to B<libpcap>"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('libpcap>=1.3.0' 'perl')
makedepends=()
url='http://search.cpan.org/dist/Net-RawIP'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SAPER/Net-RawIP-0.25.tar.gz')
md5sums=('a99f461e20e7894154f64729a4652448')
sha512sums=('c48c77389db9dc8d5c64d67e5c62bac5e3314dbc36bcfa51aa20d07224492edaa65f5c71d47ca0b804ac62b1b02387e172cd3561eadaa3a1a8040968b182b3ca')

build() {
  cd "$srcdir/Net-RawIP-0.25"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Net-RawIP-0.25"
  PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/Net-RawIP-0.25"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
