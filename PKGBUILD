# CPAN Name  : Authen-Simple-Passwd
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-authen-simple-passwd
pkgver=0.6
pkgrel=3
pkgdesc="Authen-Simple-Passwd for Perl"
arch=('any')
url="http://search.cpan.org/~chansen/Authen-Simple-Passwd-${pkgver}/"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-authen-simple')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/Authen-Simple-Passwd-${pkgver}.tar.gz")
sha256sums=('cf55bc36259edf0fd6af9ad2bac81b31dc5b56a162c660590ecb969c7c1674b2')

build() {
	cd "${srcdir}/Authen-Simple-Passwd-${pkgver}"

	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${srcdir}/Authen-Simple-Passwd-${pkgver}"

	make test
}

package() {
	cd "${srcdir}/Authen-Simple-Passwd-${pkgver}"

	make DESTDIR="${pkgdir}" install

	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

