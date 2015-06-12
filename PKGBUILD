# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=perl-locale-po
pkgver=0.27
pkgrel=1
pkgdesc="Perl/CPAN Module Locale::PO: PO parser"
arch=(any)
url="http://search.cpan.org/dist/Locale-PO"
license=("GPL" "Artistic")
source=("http://search.cpan.org/CPAN/authors/id/C/CO/COSIMO/Locale-PO-$pkgver.tar.gz")
md5sums=('81545852a510f8e5332ea1e9d6b64a39')

build() {
  cd $srcdir/Locale-PO-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/Locale-PO-$pkgver
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
