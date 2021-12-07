# Maintainer: freggel.doe <freggel.doe@gmx.net>

pkgname=perl-data-password-zxcvbn
_cpanname=Data-Password-zxcvbn
_module=Data::Password::zxcvbn
pkgver=1.0.4
pkgrel=1
pkgdesc="Check password strength"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-most' 'perl-moo' 'perl-list-allutils' 'perl-json-maybexs' 'perl-data-visitor')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/D/DA/DAKKAR/${_cpanname}-${pkgver}.tar.gz")
sha1sums=('5a23f06d283359ca8fcbdfdb8b190ecc3643e034')

build() {
    cd "$srcdir/$_cpanname-$pkgver"
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
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
