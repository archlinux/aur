# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=HTML-Packer
cpanauthor=LEEJO
pkgname=perl-html-packer
pkgver=2.11
pkgrel=1
pkgdesc="Perl HTML::Packer CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-test-simple' 'perl-regexp-reggrp' 'perl-css-packer' 'perl-javascript-packer' 'perl-safe-isa')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('c9eb975b98977044ee1e1854eb25ed8060b6d75a06b8149d78d0000cc3692892')

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
