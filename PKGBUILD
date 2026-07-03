# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=perl-acme-damn
pkgver=0.09
pkgrel=2
pkgdesc="'Unbless' Perl objects"
_dist=Acme-Damn
license=('Artistic-1.0-Perl')
options=('!emptydirs' purge)
arch=(
    'i686'
    'x86_64'
)
depends=(
    'perl'
    'perl-test-exception'
    'perl-test-simple'
)
makedepends=('perl-extutils-makemaker')
url='https://metacpan.org/release/Acme-Damn'
source=("https://www.cpan.org/authors/id/B/BR/BRTASTIC/${_dist}-${pkgver}.tar.gz")
sha256sums=('0d3a67ddc7b16fd0199c29eb6d41aabc4ffda05931dee893a55dfe28c9e661e2')

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

