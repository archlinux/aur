# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Devel-StrictMode
cpanauthor=TOBYINK
pkgname=perl-devel-strictmode
pkgver=0.003
pkgrel=1
pkgdesc="Perl Devel::StrictMode CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('b0a7de5f8aaacd8302e69ae5df0b8fd1550a3a28fbdf077cb57abcadece565f0')

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
