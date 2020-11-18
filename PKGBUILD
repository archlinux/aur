# Maintainer: silvan <silvan+aur at trollbox dot info>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=perl-acme-damn
pkgver=0.08
pkgrel=3
pkgdesc="'Unbless' Perl objects"
_dist=Acme-Damn
license=('PerlArtistic' 'GPL')
options=('!emptydirs' purge)
arch=('any')
depends=('perl' 'perl-test-exception' 'perl-test-simple')
makedepends=('perl-extutils-makemaker')
url='https://metacpan.org/release/Acme-Damn'
source=("https://search.cpan.org/CPAN/authors/id/I/IB/IBB/${_dist}-${pkgver}.tar.gz")
sha256sums=('310d2d03ff912dcd42e4d946174099f41fe3a2dd57a497d6bd65baf1759b7e0e')

build() {
    cd "${srcdir}/${_dist}-${pkgver}"
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

check() {
    cd "${srcdir}/${_dist}-${pkgver}"
    make test
}

package() {
    cd "${srcdir}/${_dist}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
