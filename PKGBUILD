# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=CSS-Packer
cpanauthor=LEEJO
pkgname=perl-css-packer
pkgver=2.02
pkgrel=1
pkgdesc="Perl CSS::Packer CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-test-simple' 'perl-regexp-reggrp')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('df4a7eb1b8e45f68e94cb4fdde6710af07f2e3ae647793323ca933f1bddfc189')

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
