# Maintainer: Thor77 <thor77 at thor77 dot org>
pkgname=perl-cgi-cookie
pkgver=4.35
pkgrel=1
pkgdesc='CGI::Cookie - Interface to HTTP Cookies'
arch=('any')
_dist='CGI'
url="https://metacpan.org/pod/CGI::Cookie"
license=('GPL')
depends=('perl')
source=("https://cpan.metacpan.org/authors/id/L/LE/LEEJO/$_dist-$pkgver.tar.gz")
md5sums=('15e63942c02354426b25f056f2a4467c')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
