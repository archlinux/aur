pkgname=perl-sendmail-pmilter
pkgver=1.27
pkgrel=1
pkgdesc="Perl binding of Sendmail Milter protocol"
arch=(any)
url="https://metacpan.org/dist/Sendmail-PMilter"
license=("GPL" "PerlArtistic")
depends=("perl")
source=("https://cpan.metacpan.org/authors/id/G/GW/GWHAYWOOD/Sendmail-PMilter-${pkgver}.tar.gz")
sha256sums=('bb5265360d3c00b312e5ede02484ec2200a5252e48bebb4978420711d8d49b66')

build() {
  cd "$srcdir"/Sendmail-PMilter-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/Sendmail-PMilter-${pkgver}
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
