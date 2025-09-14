# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=PerlX-Assert
cpanauthor=TOBYINK
pkgname=perl-perlx-assert
pkgver=0.905
pkgrel=2
pkgdesc="Perl PerlX::Assert CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-devel-declare'
   'perl-devel-strictmode'
   'perl-exporter-tiny'
   'perl-keyword-simple'
   'perl-test-modern-tmp'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('8cd67df35a31a85678aa81abdd58a654efd5ab8ca7742701cb54d60eb2c6e4f2')

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
