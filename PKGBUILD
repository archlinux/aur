# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Maintainer: ruben@vfn-nrw.de

pkgname=perl-regexp-common-net-cidr
pkgver=0.02
pkgrel=1
pkgdesc="Provide patterns for CIDR blocks"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~ruz/Regexp-Common-net-CIDR-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-regexp-common')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RU/RUZ/Regexp-Common-net-CIDR-$pkgver.tar.gz")
sha256sums=('8e30aab781ef5e571b366ca66ba2338e6f072386e118238b19528a85284f3e7f')

build() {
	cd "$srcdir/Regexp-Common-net-CIDR-$pkgver"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "$srcdir/Regexp-Common-net-CIDR-$pkgver"
	make install DESTDIR="$pkgdir"
}
