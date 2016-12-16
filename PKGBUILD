# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Keyword-Simple
cpanauthor=MAUKE
pkgname=perl-keyword-simple
pkgver=0.03
pkgrel=1
pkgdesc="Perl Keyword-Simple CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-b-hooks-endofscope')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('3e0f75e33c8c2ccc82e89d74660bebe4f74ef5330ab3042d9243337061ef6ce8')

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
