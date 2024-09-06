# Maintainer: freggel.doe <freggel.doe@gmx.net>

pkgname=perl-crypt-generatepassword
_cpanname=Crypt-GeneratePassword
_module=Crypt::GeneratePassword
pkgver=0.05
pkgrel=2
pkgdesc="generate secure random pronounceable passwords"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-crypt-cracklib')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/${_cpanname}-${pkgver}.tar.gz")
sha1sums=('99d12d56eae45a335b01c127480dfade41db34c5')

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
