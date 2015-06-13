# Maintainer: Thaodan <theodorstormgrade@gmail.com>
pkgname=perl-devel-trace
pkgver=0.12
pkgrel=1
pkgdesc="Print out each line before it is executed (like sh -x)"
arch=(any)
url="http://search.cpan.org/dist/Devel-Trace/Trace.pm"
license=('custom')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/MJ/MJD/Devel-Trace-$pkgver.tar.gz
        LICENSE)
md5sums=('6cea68e7e12f99cb94c7802346f15ab3'
         'b9137859038cf848c1d932fc3a00468d')

build() {
  cd "$srcdir/Devel-Trace-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Devel-Trace-${pkgver}"
  make install DESTDIR="$pkgdir/"
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
