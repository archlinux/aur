# Maintainer: khvalera <khvalera[at]ukr[dot]net>

pkgname='perl-edid'
pkgver='1.0.7'
pkgrel='1'
pkgdesc="Parse::EDID - Extended display identification data (EDID) parser"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('make' 'perl-test-warn')
url='https://metacpan.org/pod/Parse::EDID'
source=("https://cpan.metacpan.org/authors/id/G/GR/GROUSSE/Parse-EDID-${pkgver}.tar.gz")
sha512sums=('a66a53e1ed9e09e3e5dd25c10eb58a6e568338c1c67333937fa1b17185dbde7c5ea4ff6859b7fd32649047733e93eb6095cc4ac326c1035cf491f983a6be7019')

build() {
   cd "${srcdir}/Parse-EDID-${pkgver}"

   perl Makefile.PL INSTALLDIRS=vendor
   make
}

check() {
   cd "${srcdir}/Parse-EDID-${pkgver}"

   make test
}

package() {
   cd "${srcdir}/Parse-EDID-${pkgver}"

   make DESTDIR="${pkgdir}" install

   find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}