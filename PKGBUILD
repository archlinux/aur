# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Return-Type
cpanauthor=TOBYINK
pkgname=perl-return-type
pkgver=0.005
pkgrel=1
pkgdesc="Perl Return::Type CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-test-fatal' 'perl-type-tiny')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('6666f8103cfa6beb2bc71a20f2686bd98bbd5edf1e9df9d60e0a6dc2b7f3293a')

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
