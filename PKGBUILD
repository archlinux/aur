# Maintainer: Ábel Futó
# Contributor: Ábel Futó <lebaotuf@gmail.com>
pkgname=perl-cpu-z80-assembler
pkgver=2.25
pkgrel=1
pkgdesc="This module implements a Z80 assembler"
arch=(any)
url="https://metacpan.org/dist/CPU-Z80-Assembler"
license=('GPL2' 'PerlArtistic')
depends=('perl-asm-preproc' 'perl-regexp-trie')
makedepends=('make')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/P/PS/PSCUST/CPU-Z80-Assembler-$pkgver.tar.gz")
sha256sums=('709f05976299c3dfdb9c10d4cc5bb0c1dc3dc76dce52f71fb64efc930eda6dd5')

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
