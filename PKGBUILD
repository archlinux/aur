# Maintainer: Ábel Futó
# Contributor: Ábel Futó <lebaotuf@gmail.com>
pkgname=perl-cpu-z80-assembler
pkgver=2.18
pkgrel=1
pkgdesc="This module implements a Z80 assembler"
arch=(any)
url="https://metacpan.org/dist/CPU-Z80-Assembler"
license=('GPL2' 'PerlArtistic')
depends=('perl-asm-preproc' 'perl-regexp-trie')
makedepends=('make')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/P/PS/PSCUST/CPU-Z80-Assembler-$pkgver.tar.gz")
sha256sums=('c50c8dac1e4dcc5c54c20a48d37b48f1cf5a26e4e8190bd07d467521b6c5ce13')

build() {
    cd "$srcdir/CPU-Z80-Assembler-$pkgver"

    perl Makefile.PL installdirs=vendor destdir="$pkgdir/"
    make
}

package() {
    cd "$srcdir/CPU-Z80-Assembler-$pkgver"
    make install

    # remove perllocal.pod and .packlist
    find "$pkgdir" -name perllocal.pod -delete
    find "$pkgdir" -name .packlist -delete
}
