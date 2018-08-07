# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=JavaScript-Packer
cpanauthor=LEEJO
pkgname=perl-javascript-packer
pkgver=2.04
pkgrel=2
pkgdesc="Perl JavaScript::Packer CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-test-simple' 'perl-regexp-reggrp')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('826fff0d047a8991d3afc7723520643589c3ef7dcfd342931c23cf586f9f4ff0')

build() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Makefile.PL
	 make
}

check() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make test
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
