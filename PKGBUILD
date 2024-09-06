# Maintainer: freggel.doe <freggel.doe@gmx.net>

pkgname=perl-authen-webauthn
_cpanname=Authen-WebAuthn
_module=Authen::WebAuthn
pkgver=0.004
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
sha256sums=('b465056a4b751cd3c2d6c5076de8540d83fbe3dc15eb6f419b64b70f72c2cab8')

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
