# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=CSS-Packer
cpanauthor=LEEJO
pkgname=perl-css-packer
pkgver=2.09
pkgrel=1
pkgdesc="Perl CSS::Packer CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-test-simple' 'perl-regexp-reggrp')
makedepends=('perl-test-file-contents' 'perl-test-memory-cycle' 'perl-test-pod')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('6f6384f34c78ab819ac75f8167bfb259cd51cd6348ba88d62a9f27a8ca96c0be')

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
