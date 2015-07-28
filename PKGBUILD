# Maintainer: Ian Guthrie <iguthrie [at] aol [dot] com>
# Contributor: der_FeniX <derfenix [at] gmail [dot] com>

pkgname=perl-filesys-df
pkgver=0.92
pkgrel=2
pkgdesc="Perl extension for filesystem disk space information"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~iguthrie/Filesys-Df-0.92/"
license=(GPL3)
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/I/IG/IGUTHRIE/Filesys-Df-${pkgver}.tar.gz)
md5sums=('a8b0aa3e5151a8a6c8b3067625980934')

build() {
   cd ${srcdir}/Filesys-Df-${pkgver}
   perl Makefile.PL || return 1
   make || return 1
}


package() {
   cd ${srcdir}/Filesys-Df-${pkgver}
   make DESTDIR="${pkgdir}" install || return 1
}
