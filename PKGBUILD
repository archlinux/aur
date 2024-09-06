# Maintainer: freggel.doe <freggel.doe@gmx.net>

pkgname=perl-data-password-zxcvbn
_cpanname=Data-Password-zxcvbn
_module=Data::Password::zxcvbn
pkgver=1.1.2
pkgrel=2
pkgdesc="Check password strength"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-moo' 'perl-list-allutils')
checkdepends=('perl-test-most' 'perl-json-maybexs' 'perl-data-visitor')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/D/DA/DAKKAR/${_cpanname}-${pkgver}.tar.gz")
sha256sums=('9b55a2b2264f7ecd43f5bda80d96f9374a4bf55a81aaca2acfe903e0a9b77b77')

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
