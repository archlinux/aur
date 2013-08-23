# CPAN Name  : Test::Email
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>

pkgname=perl-test-email
pkgver=0.07
pkgrel=1
pkgdesc="Perl module to test Email contents"
arch=("any")
url="http://search.cpan.org/dist/Test-Email"
license=("PerlArtistic" "GPL")
depends=("perl>=5.6.2" "perl-mail-pop3client>=2" "perl-mail-sendmail>=0.79" "perl-mime-tools>=5.4")
source=(http://search.cpan.org/CPAN/authors/id/J/JA/JAMES/Test-Email-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=("be2f80d2dbdd2f9c3329237402ebcf14")

build() {
  cd "$srcdir/Test-Email-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Test-Email-$pkgver"
  make test
}

package() {
  cd "$srcdir/Test-Email-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
