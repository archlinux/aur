# Maintainer: freggel.doe <freggel.doe@gmx.net>

pkgname=perl-data-password-zxcvbn
_cpanname=Data-Password-zxcvbn
_module=Data::Password::zxcvbn
pkgver=1.1.3
pkgrel=1
pkgdesc="Check password strength"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-moo' 'perl-list-allutils')
checkdepends=('perl-test-most' 'perl-json-maybexs' 'perl-data-visitor')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/D/DA/DAKKAR/${_cpanname}-${pkgver}.tar.gz")
sha256sums=('09637828a22c3c63cdb7d55f0f53ce0c009c7602ce365cbb02ee0478497da073')

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
