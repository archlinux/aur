# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=PerlX-Assert
cpanauthor=TOBYINK
pkgname=perl-perlx-assert
pkgver=0.904
pkgrel=1
pkgdesc="Perl PerlX::Assert CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-devel-strictmode'
   'perl-exporter-tiny'
   'perl-keyword-simple'
   'perl-test-modern'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('2d20aa2377dc5cf03629171fa5d0867cdc9d4ac0c582ef684520358abc91b1c1')

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
