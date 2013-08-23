# CPAN Name  : Test::WWW::Mechanize::PSGI
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.13

pkgname=perl-test-www-mechanize-psgi
pkgver=0.35
pkgrel=1
pkgdesc="Perl module to test PSGI programs using WWW::Mechanize"
arch=("any")
url="http://search.cpan.org/dist/Test-WWW-Mechanize-PSGI"
license=("PerlArtistic" "GPL")
depends=("perl" "perl-plack" "perl-test-www-mechanize" "perl-try-tiny")
source=(http://search.cpan.org/CPAN/authors/id/L/LB/LBROCARD/Test-WWW-Mechanize-PSGI-0.35.tar.gz)
options=(!emptydirs)
md5sums=("f8403d6ccdef06aacb9092715e2dde26")

build() {
  cd "$srcdir/Test-WWW-Mechanize-PSGI-0.35"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Test-WWW-Mechanize-PSGI-0.35"
  make test
}

package() {
  cd "$srcdir/Test-WWW-Mechanize-PSGI-0.35"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
