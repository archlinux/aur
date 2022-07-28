# Maintainer: Ábel Futó
# Contributor: Ábel Futó <lebaotuf@gmail.com>
pkgname=perl-iterator-simple-lookahead
pkgver=0.09
pkgrel=1
pkgdesc="Simple iterator with lookahead and unget"
arch=(any)
url="https://metacpan.org/dist/Iterator-Simple-Lookahead"
license=('PerlArtistic')
depends=('perl-class-accessor' 'perl-iterator-simple')
makedepends=('make')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/P/PS/PSCUST/Iterator-Simple-Lookahead-$pkgver.tar.gz")
sha256sums=('1663c4d71754f0b0174b6d7e1f80c9690f3ba838b84385242dac2c500aac799c')

build() {
    cd "$srcdir/Iterator-Simple-Lookahead-$pkgver"

    perl Makefile.PL installdirs=vendor destdir="$pkgdir/"
    make
}

package() {
    cd "$srcdir/Iterator-Simple-Lookahead-$pkgver"
    make install

    # remove perllocal.pod and .packlist
    find "$pkgdir" -name perllocal.pod -delete
    find "$pkgdir" -name .packlist -delete
}
