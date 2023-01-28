# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=CSS-Packer
cpanauthor=LEEJO
pkgname=perl-css-packer
pkgver=2.08
pkgrel=1
pkgdesc="Perl CSS::Packer CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-test-simple' 'perl-regexp-reggrp')
makedepends=('perl-test-file-contents' 'perl-test-memory-cycle' 'perl-test-pod')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('b25cf4ff54e650c1195abe4eeccaac700dd220da827edb14e946a74e8dc412ef')

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
