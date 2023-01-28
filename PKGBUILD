# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=JavaScript-Packer
cpanauthor=LEEJO
pkgname=perl-javascript-packer
pkgver=2.11
pkgrel=1
pkgdesc="Perl JavaScript::Packer CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-test-simple' 'perl-regexp-reggrp')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('1b28cc514b9ae8a041020c087d3cc202031c16faa893afabb65fa6ba2e6e1101')

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
