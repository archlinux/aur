# Maintainer: Florian Pritz <flo@xinu.at
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=perl-file-next
_pkgname=File-Next
pkgver=1.06
pkgrel=1
pkgdesc='File::Next - File-finding iterator'
arch=('any')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_pkgname}"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-$pkgver.tar.gz)
md5sums=('8d901b18e40c477acd18a6ea0fd7de64')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  make install DESTDIR="$pkgdir"
}
