# CPAN Name  : HTML::Lint
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-html-lint
pkgver=2.20
pkgrel=1
pkgdesc="Perl module to check for HTML errors in a string or file"
arch=("any")
url="http://search.cpan.org/dist/HTML-Lint"
license=("PerlArtistic")
depends=("perl>=5.6.2" "perl-html-parser>=3.47" "perl-html-tagset>=3.03")
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/HTML-Lint-2.20.tar.gz)
options=(!emptydirs)
md5sums=("c6063f33797d6a36dc3ae2e0c3d06ded")

build() {
  cd "$srcdir/HTML-Lint-2.20"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/HTML-Lint-2.20"
  make test
}

package() {
  cd "$srcdir/HTML-Lint-2.20"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
