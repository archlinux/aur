# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=HTML-Packer
cpanauthor=LEEJO
pkgname=perl-html-packer
pkgver=2.10
pkgrel=1
pkgdesc="Perl HTML::Packer CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-test-simple' 'perl-regexp-reggrp' 'perl-css-packer' 'perl-javascript-packer')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('70a4e559cf038993425ba77df2810f904c1b19a7769891d894ac69a819f4ced9')

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
