# Maintainer: freggel.doe <freggel.doe@gmx.net>

# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-crypt-urandom
_cpanname=Crypt-URandom
pkgver=0.47
pkgrel=1
pkgdesc="Provide non blocking randomness"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-pod')
url="https://metacpan.org/release/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/D/DD/DDICK/$_cpanname-$pkgver.tar.gz")
md5sums=('9a3640ef54bdf9c7e16798343177528d')
sha512sums=('6104ec454682cda53799a7cd3344bee8d2c8f3b4f76342093916ddb80b3b217051d6462ab2c6a0b9098a8805894aa68fb6fdfaca05818d0f6335511322586c69')

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
