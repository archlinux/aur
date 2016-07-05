# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname=perl-module-versions-report
pkgver=1.06
pkgrel=1
pkgdesc='Report versions of all modules in memory'
arch=('i686' 'x86_64')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~jesse/Module-Versions-Report-$pkgver/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Module-Versions-Report-$pkgver.tar.gz")
sha256sums=('a3261d0d84b17678d8c4fd55eb0f892f5144d81ca53ea9a38d75d1a00ad9796a')

build() {
	cd "$srcdir/Module-Versions-Report-$pkgver"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "$srcdir/Module-Versions-Report-$pkgver"
	make install DESTDIR="$pkgdir"
}
