# Maintainer: freggel.doe <freggel.doe@gmx.net>

pkgname=perl-text-mediawikiformat
_cpanname=Text-MediawikiFormat
_module=Text::MediawikiFormat
pkgver=1.04
pkgrel=3
pkgdesc="Translate Wiki markup into other text formats"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-nowarnings' 'perl-test-warn')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/S/SZ/SZABGAB/${_cpanname}-${pkgver}.tar.gz")
sha1sums=('81dc3a467790234c62eac138d0f1a9c52c36ba36')

build() {
    cd "$srcdir/$_cpanname-$pkgver"
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check() {
    cd "$srcdir/$_cpanname-$pkgver"
    make test
}

package() {
    cd "$srcdir/$_cpanname-$pkgver"
    make install DESTDIR="$pkgdir"
}

# vim:set ts=4 sw=4 expandtab:
