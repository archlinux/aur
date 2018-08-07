# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=HTML-Packer
cpanauthor=LEEJO
pkgname=perl-html-packer
pkgver=2.07
pkgrel=2
pkgdesc="Perl HTML::Packer CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-test-simple' 'perl-regexp-reggrp' 'perl-css-packer' 'perl-javascript-packer')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('fb43cf06ce1f57fcbdb27b4a5049f56dae9005f609eb1f0ecc77bf00cf2c3ab1')

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
