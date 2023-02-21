# Maintainer: Alcubierre Drive <alcubierre-drive@github>
pkgname=geo-osm-tiles
pkgname_cap=Geo-OSM-Tiles
pkgver=0.02
pkgrel=1
pkgdesc="Utility that enables download of OSM tiles (downloadosmtiles.pl)"
arch=('any')
url="https://metacpan.org/release/ROTKRAUT/Geo-OSM-Tiles-0.02/view/downloadosmtiles.pl"
license=('Perl')
#groups=('base-devel')
depends=('perl')
makedepends=('make')
source=("https://cpan.metacpan.org/authors/id/R/RO/ROTKRAUT/${pkgname_cap}-${pkgver}.tar.gz")
sha512sums=('67c3909a7aa14a3b807e89c163033e716a5026c481734a05a1eda3411e512082f4518845772655f42ee9328bf7242bae3c89e1fbc0258a38f43850aeca6a494b')

build() {
    cd "$srcdir/${pkgname_cap}-$pkgver"
    PERL_USE_UNSAFE_INC=1 \
    PERL_MM_USE_DEFAULT=1 \
    perl Makefile.PL INSTALLDIRS=site
    make
}

package() {
    cd "$srcdir/${pkgname_cap}-$pkgver"
    make pure_install doc_install DESTDIR="$pkgdir"
}
