# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-data-sexpression
_cpanname=Data-SExpression
pkgver=0.41
pkgrel=1
pkgdesc="Parse List S-Expressions into perl data structures"
arch=(any)
url="http://metacpan.org/release/Data-SExpression"
license=('Perl')
depends=('perl' 'perl-class-accessor')
checkdepends=('perl-test-deep')
options=('!emptydirs')
source=(http://cpan.metacpan.org/authors/id/N/NE/NELHAGE/$_cpanname-$pkgver.tar.gz)
md5sums=('52cefada95e787678a90e43934d3c5ce')

build() {
  cd  $srcdir/$_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check() {
  cd  $srcdir/$_cpanname-$pkgver
  make test
}
package() {
  cd  $srcdir/$_cpanname-$pkgver
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
