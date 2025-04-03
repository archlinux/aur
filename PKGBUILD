# Maintainer: freggel.doe <freggel.doe@gmx.net>

pkgname=perl-crypt-pbkdf2
_cpanname=Crypt-PBKDF2
_module=Crypt::PBKDF2
pkgver=0.161520
pkgrel=2
pkgdesc="The PBKDF2 password hashing algorithm"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-strictures' 'perl-type-tiny')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/${_cpanname}-${pkgver}.tar.gz")
sha1sums=('250da24c7aa08de07422ee8668eba3135d00fe0a')

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
