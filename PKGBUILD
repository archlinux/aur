# Maintainer: freggel.doe <freggel.doe@gmx.net>
# Contributor: Andrew Rodland

pkgname=perl-crypt-pbkdf2
_cpanname=Crypt-PBKDF2
_module=Crypt::PBKDF2
pkgver=0.261630
pkgrel=1
pkgdesc="The PBKDF2 password hashing algorithm"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-strictures' 'perl-type-tiny' 'perl-crypt-urandom')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-fatal' 'perl-moo' 'perl-namespace-autoclean')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/${_cpanname}-${pkgver}.tar.gz")
sha1sums=('699cfaeb3ea8e679a514bf400703b31d68af4f42')

build() {
    cd "$srcdir/$_cpanname-$pkgver"
    perl Build.PL
    ./Build
}

check() {
    cd "$srcdir/$_cpanname-$pkgver"
    ./Build test
}

package() {
    cd "$srcdir/$_cpanname-$pkgver"
    ./Build install --destdir "$pkgdir"
}

# vim:set ts=4 sw=4 expandtab:
