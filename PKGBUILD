# Maintainer: freggel.doe <freggel.doe@gmx.net>

# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-crypt-urandom
_cpanname=Crypt-URandom
pkgver=0.53
pkgrel=1
pkgdesc="Provide non blocking randomness"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-pod')
url="https://metacpan.org/release/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/D/DD/DDICK/$_cpanname-$pkgver.tar.gz")
md5sums=('56f7d4e3af42fa683b4241adc03e349c')
sha512sums=('f6978ae8fff4c56bfa2941d962f3c1c81965c93db450d49224c34b6809048a37b001c9eebbebd697908ce5d7bd85d793d541cf2bd73e59da59ece3f292fd1fc4')

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
