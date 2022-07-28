# Maintainer: Ábel Futó
# Contributor: Ábel Futó <lebaotuf@gmail.com>
pkgname=perl-iterator-simple
pkgver=0.07
pkgrel=1
pkgdesc="Simple iterator and utilities"
arch=(any)
url="https://metacpan.org/dist/Iterator-Simple"
license=('PerlArtistic')
depends=('perl-scalar-list-utils')
makedepends=('make' 'perl-module-install')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/M/MI/MICHAEL/Iterator-Simple-$pkgver.tar.gz")
sha256sums=('cb574d063bb481c8fb9cb5781a4645896aa0e1ee715ba947cf766f1ff4e9eb44')

build() {
    cd "$srcdir/Iterator-Simple-$pkgver"

    perl Makefile.PL installdirs=vendor destdir="$pkgdir/"
    make
}

package() {
    cd "$srcdir/Iterator-Simple-$pkgver"
    make install

    # remove perllocal.pod and .packlist
    find "$pkgdir" -name perllocal.pod -delete
    find "$pkgdir" -name .packlist -delete
}
