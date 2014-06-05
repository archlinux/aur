# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-apireference
_realname=Perl-APIReference
pkgver=0.16
pkgrel=1
pkgdesc="Programatically query the perlapi"
arch=('any')
url="https://metacpan.org/release/Perl-APIReference"
license=('LGPL' 'PerlArtistic')
depends=('perl' 'perl-class-xsaccessor')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/S/SM/SMUELLER/$_realname-$pkgver.tar.gz")
md5sums=('972ca4a08567254615c7722e007ab940')

build() {
  cd  "$srcdir/$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd  "$srcdir/$_realname-$pkgver"
  make install DESTDIR="$pkgdir"
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
