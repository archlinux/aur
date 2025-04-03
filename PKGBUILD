# Maintainer: freggel.doe <freggel.doe@gmx.net>

# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-crypt-urandom
_cpanname=Crypt-URandom
pkgver=0.54
pkgrel=1
pkgdesc="Provide non blocking randomness"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-pod')
url="https://metacpan.org/release/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/D/DD/DDICK/$_cpanname-$pkgver.tar.gz")
md5sums=('011113679de05d1c2bea37fe92f60278')
sha512sums=('8cc54711c8c260926ce4d6b777a1e797699d09a7425df26afde4427d2a5c63902391d9fdf9ad488555849a242fac23a8d4af16867da982f96384cd70ccb14898')

build() {
    cd "$srcdir/$_cpanname-$pkgver"
    (
        export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
        perl Makefile.PL INSTALLDIRS=vendor DESTDIR="$pkgdir" NO_PACKLIST=1 NO_PERLLOCAL=1
        make
    )
}

check() {
    cd "$srcdir/$_cpanname-$pkgver"
    LANG=C PERL_MM_USE_DEFAULT=1 PERL5LIB="" make test
}

package() {
    cd "$srcdir/$_cpanname-$pkgver"
    make install
}

# vim:set ts=4 sw=4 expandtab:
