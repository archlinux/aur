# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=MooseX-MungeHas
cpanauthor=TOBYINK
pkgname=perl-moosex-mungehas
pkgver=0.007
pkgrel=1
pkgdesc="Perl MooseX::MungeHas CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-test-requires'
   'perl-type-tiny'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('33ecefb1ede1eb6c6ab1f458a6db81945549d73dcbe7c476ca80677bb659d2bd')

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
