# CPAN Name  : CGI::Application::Plugin::DBH
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-cgi-application-plugin-dbh
pkgver=4.01
pkgrel=1
pkgdesc="Perl package for easy DBI access from CGI::Application"
arch=("any")
url="http://search.cpan.org/dist/CGI-Application-Plugin-DBH"
license=("PerlArtistic" "GPL")
depends=("perl>=5.10.1" "perl-cgi-application" "perl-dbi")
checkdepends=("perl-test-mockobject>=1.20120301" "perl-dbd-mock>=0.11")
makedepends=("perl")
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKSTOS/CGI-Application-Plugin-DBH-4.01.tar.gz)
options=(!emptydirs)
md5sums=("ca72a77ad5ec453459db4b1e418ca0de")

build() {
  cd "$srcdir/CGI-Application-Plugin-DBH-4.01"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/CGI-Application-Plugin-DBH-4.01"
  make test
}

package() {
  cd "$srcdir/CGI-Application-Plugin-DBH-4.01"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
