# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=perl-xml-descent
_cpanname=XML-Descent
pkgver=1.04
pkgrel=1
pkgdesc="Recursive descent XML parsing"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
checkdepends=('perl-test-differences' 'perl-test-more')
depends=('perl-xml-tokeparser');
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/A/AN/ANDYA/${_cpanname}-${pkgver}.tar.gz")
md5sums=('9e00f2c1a31d8cacd91fb23a30dc6fc6')

build() {
  cd  "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
