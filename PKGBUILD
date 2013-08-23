# CPAN Name  : TeX::Encode
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-tex-encode
pkgver=1.3
pkgrel=1
pkgdesc="Perl module to encode/decode UTF-8 strings into TeX"
arch=("any")
url="http://search.cpan.org/dist/TeX-Encode"
license=("GPL" "PerlArtistic")
source=(http://search.cpan.org/CPAN/authors/id/T/TI/TIMBRODY/TeX-Encode-1.3.tar.gz)
depends=("perl" "perl-html-parser")
checkdepends=("perl-test-pod-coverage")
options=(!emptydirs)
md5sums=("ffc51bdcbfa533e886c47bcfda8cf591")

build() {
  cd "$srcdir/TeX-Encode-1.3"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/TeX-Encode-1.3"
  make test
}

package() {
  cd "$srcdir/TeX-Encode-1.3"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
