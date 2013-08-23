# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-cache-simple-timedexpiry
pkgver=0.27
pkgrel=1
pkgdesc="Perl module providing a lightweight cache with timed expiration"
arch=("any")
url="http://search.cpan.org/dist/Cache-Simple-TimedExpiry/"
license=("GPL" "PerlArtistic")
depends=("perl")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Cache-Simple-TimedExpiry-$pkgver.tar.gz)
md5sums=("4ef124ab7776f3c257b9ffbed917e67a")

build() {
  cd "$srcdir/Cache-Simple-TimedExpiry-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}  

check() {
  cd "$srcdir/Cache-Simple-TimedExpiry-$pkgver"
  make test
}

package() {
  cd "$srcdir/Cache-Simple-TimedExpiry-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
