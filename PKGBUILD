# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-ouch
pkgver=0.0401
pkgrel=1
pkgdesc="Perl module for exceptions that don't hurt"
arch=("any")
url="http://search.cpan.org/dist/Ouch/"
license=("GPL" "PerlArtistic")
depends=("perl")
checkdepends=("perl-test-trap")
source=(http://search.cpan.org/CPAN/authors/id/R/RI/RIZEN/Ouch-$pkgver.tar.gz)
md5sums=("c60aac3b0ed7438ef3a68b66fb222de3")

build() {
  cd "$srcdir/Ouch-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Ouch-$pkgver"
  make test
}

package() {
  cd "$srcdir/Ouch-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
