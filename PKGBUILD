# Maintainer: desbma
pkgname=perl-lockfile-simple
_cpanname="LockFile-Simple"
pkgver=0.208
pkgrel=2
pkgdesc="Perl/CPAN Module Crypt::Simple"
url="http://search.cpan.org/dist/LockFile-Simple"
license=("GPL" "PerlArtistic")
arch=("any")
source=("http://search.cpan.org/CPAN/authors/id/S/SC/SCHWIGON/${pkgname#perl-}/${_cpanname}-${pkgver}.tar.gz")
sha512sums=('a1234d11cdb7bb98bd3d6c2504697187f2f7979c7acd7cfb0398f358f390af7b5eb7d834e83c83b0515199ac8d9a306d7fcdc96df04b0513f821887ad49fd67e')

build() {
    cd "${srcdir}/${_cpanname}-${pkgver}"

    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor

    make
}

package() {
    cd "${srcdir}/${_cpanname}-${pkgver}"

    make pure_install doc_install DESTDIR="${pkgdir}"

    find "${pkgdir}" -name ".packlist" -delete
    find "${pkgdir}" -name "*.pod" -delete
}
