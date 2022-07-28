# Maintainer: Ábel Futó
# Contributor: Ábel Futó <lebaotuf@gmail.com>
pkgname=perl-asm-preproc
pkgver=1.03
pkgrel=1
pkgdesc="Preprocessor to be called from an assembler"
arch=(any)
url="https://metacpan.org/pod/Asm::Preproc"
license=('GPL' 'PerlArtistic')
depends=('perl-iterator-simple-lookahead' 'perl-text-template' 'perl-data-dump')
makedepends=('make')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/P/PS/PSCUST/Asm-Preproc-$pkgver.tar.gz")
sha256sums=('a554e922a1b166907166501b5ee1836a9b8ec6ca77b8cfc033974a53195e8f53')

build() {
    cd "$srcdir/Asm-Preproc-$pkgver"

    perl Makefile.PL installdirs=vendor destdir="$pkgdir/"
    make
}

package() {
    cd "$srcdir/Asm-Preproc-$pkgver"
    make install

    # remove perllocal.pod and .packlist
    find "$pkgdir" -name perllocal.pod -delete
    find "$pkgdir" -name .packlist -delete
}
