# Maintainer: freggel.doe <freggel.doe@gmx.net>

pkgname=perl-authen-webauthn
_cpanname=Authen-WebAuthn
_module=Authen::WebAuthn
pkgver=0.005
pkgrel=1
pkgdesc="A library to add Web Authentication support to server applications"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-cbor-xs' 'perl-cryptx' 'perl-crypt-openssl-x509' 'perl-json-xs' 'perl-mouse' 'perl-uri')
makedepends=()
checkdepends=('perl-hash-merge-simple')
options=('!emptydirs')
source=(
    "https://cpan.metacpan.org/authors/id/M/MB/MBESSON/$_cpanname-$pkgver.tar.gz"
)
sha256sums=('d583bf5dacb4fef19379ab24348bfea230cca97c4e078e1836ad0a421200014e')

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
