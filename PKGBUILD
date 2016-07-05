# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname=perl-text-quoted
pkgver=2.06
pkgrel=1
pkgdesc="Extract the structure of a quoted mail message"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Text-Quoted/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RU/RUZ/Text-Quoted-$pkgver.tar.gz")
md5sums=('6ae8d3aa3a54c5f05bcd0c2313ebfa4d')

build() {
	cd "$srcdir/Text-Quoted-$pkgver"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "$srcdir/Text-Quoted-$pkgver"
	make install DESTDIR="$pkgdir"
}
