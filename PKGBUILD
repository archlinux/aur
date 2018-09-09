# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=perl-uri-simple
pkgver=1.00
pkgrel=1
pkgdesc="URI::Simple - Simple way to parse uri"
arch=('i686' 'x86_64')
url="https://metacpan.org/pod/URI::Simple"
license=('PerlArtistic')
depends=()
source=(https://cpan.metacpan.org/authors/id/M/MA/MAMOD/URI-Simple-$pkgver.tar.gz)
md5sums=('94eddcb8bad3afe78f9dbde08cfeadb9')
sha1sums=('4b5ce470445e82e1500f2f5d6ccaa1459269507d')
options=('!emptydirs')

build() {
    cd "$srcdir/URI-Simple-$pkgver"
    perl Makefile.PL INSTALLDIRS=vendor
    make || return 1
}
package() {
    cd "$srcdir/URI-Simple-$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
