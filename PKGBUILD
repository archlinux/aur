# CPAN Name  : Imager::QRCode
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-imager-qrcode
pkgver=0.034
pkgrel=6
pkgdesc='Imager-QRCode for Perl'
arch=('i686' 'x86_64')
url="http://search.cpan.org/~kurihara/Imager-QRCode-${pkgver}/"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-imager' 'qrencode')
makedepends=('perl-module-install')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/K/KU/KURIHARA/Imager-QRCode-${pkgver}.tar.gz")
sha256sums=('ed370829552dcdf17a073bc477a1cb5782731d500d63f415bf4886152047d475')

build() {
	cd "Imager-QRCode-${pkgver}"

	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "Imager-QRCode-${pkgver}"

	make test
}

package() {
	cd "Imager-QRCode-${pkgver}"

	make DESTDIR="${pkgdir}" install
	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

