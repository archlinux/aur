# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=XMLRPC-Lite
cpanauthor=PHRED
pkgname=perl-xmlrpc-lite
pkgver=0.717
pkgrel=1
pkgdesc="Perl XMLRPC::Lite CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-soap-lite')
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('3a9fa5f2cb1faf8b7c66b4c386eab35cac6088afc4dbc757d4f77d284dab4524')

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
