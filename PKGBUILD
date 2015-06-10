# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=perl-list-compare
_pkgname=List-Compare
pkgver=0.53
pkgrel=1
pkgdesc="Compare elements of two or more lists"
arch=('any')
url="http://search.cpan.org/~JKEENAN/List-Compare/"
license=('GPL' 'PerlArtistic')
makedepends=('perl-io-captureoutput')
depends=('perl')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/J/JK/JKEENAN/${_pkgname}-$pkgver.tar.gz) 
sha256sums=('fdbf4ff67b3135d44475fef7fcac0cd4706407d5720d26dca914860eb10f8550')

build() {
  cd $srcdir/${_pkgname}-$pkgver

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/${_pkgname}-$pkgver

  make DESTDIR=${pkgdir} install

  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}

