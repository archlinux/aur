# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-cgi-cookie-splitter
pkgver=0.02
pkgrel=1
pkgdesc="Perl package to split big cookies into smaller ones"
arch=("any")
url="http://search.cpan.org/dist/CGI-Cookie-Splitter/"
license=("GPL" "PerlArtistic")
depends=("perl" "perl-cgi-simple")
makedepends=()                      # 'perl' provides 'perl-extutils-makemaker'
checkdepends=("perl-test-use-ok")   # 'perl' provides 'perl-test-simple'
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/CGI-Cookie-Splitter-$pkgver.tar.gz)
md5sums=("0667729771df4aef5d56ee80fb44ac55")

build() {
  cd "$srcdir/CGI-Cookie-Splitter-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/CGI-Cookie-Splitter-$pkgver"
  make test
}

package() {
  cd "$srcdir/CGI-Cookie-Splitter-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
