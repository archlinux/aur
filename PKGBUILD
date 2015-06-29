# CPAN Name  : HTML::QRCode
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-html-qrcode
pkgver=0.01
pkgrel=3
pkgdesc='HTML-QRCode for Perl'
arch=('any')
url="http://search.cpan.org/~hide/HTML-QRCode-${pkgver}/"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-text-qrcode')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/H/HI/HIDE/HTML-QRCode-${pkgver}.tar.gz")
sha256sums=('26e23ae91f4ed816a3f45c5784ba69c44f6406a68897313517d797a407b3b22f')

build() {
	cd "${srcdir}/HTML-QRCode-${pkgver}"

	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${srcdir}/HTML-QRCode-${pkgver}"

	make test
}

package() {
	cd "${srcdir}/HTML-QRCode-${pkgver}"

	make DESTDIR="${pkgdir}" install

	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

