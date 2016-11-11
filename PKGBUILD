# Maintainer: Thor77 <thor77 at thor77 dot org>
pkgname=perl-html-template-pro
pkgver=0.9510
pkgrel=1
pkgdesc='HTML::Template::Pro - Perl/XS module to use HTML Templates from CGI scripts'
arch=('any')
_dist='HTML-Template-Pro'
url="https://metacpan.org/pod/HTML::Template::Pro"
license=('LGPL')
depends=('perl')
source=("https://cpan.metacpan.org/authors/id/V/VI/VIY/$_dist-$pkgver.tar.gz")
md5sums=('28c25f87ed2cec1ecbe78a2ff9548d0a')

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
