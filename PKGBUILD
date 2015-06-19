# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=perl-grutatxt
_realpkgname=Grutatxt
pkgver=2.0.16
pkgrel=2
pkgdesc="A plain text to HTML (and other formats) converter"
arch=('i686' 'x86_64')
url="http://triptico.com/software/grutatxt.html"
license=('GPL2')
depends=('perl')
source=("http://triptico.com/download/grutatxt/$_realpkgname-$pkgver.tar.gz")
md5sums=('c4ed46b4470442bfdea312679d188eb6')

build() {
  cd "$srcdir/$_realpkgname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_realpkgname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
