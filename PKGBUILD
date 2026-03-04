# Maintainer: freggel.doe <freggel.doe@gmx.net>

# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-crypt-urandom
_cpanname=Crypt-URandom
pkgver=0.55
pkgrel=1
pkgdesc="Provide non blocking randomness"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-pod')
url="https://metacpan.org/release/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/D/DD/DDICK/$_cpanname-$pkgver.tar.gz")
md5sums=('60c244edf9cdb18e5dd509703672fc20')
sha512sums=('84c050078668842eeb377181fdfa3c0170919e2c39b18c4d02bbd4ac638f3ff35f98981afe13d0b2a3cf6f844934a030b1da1121272bc8c15f9db8bd2450bdb7')

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
