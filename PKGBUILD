# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=PerlX-Define
cpanauthor=TOBYINK
pkgname=perl-perlx-define
pkgver=0.101
pkgrel=1
pkgdesc="Perl PerlX::Define CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
    'perl'
    'perl-keyword-simple'
    'perl-namespace-clean'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('ea50c41793bcc9cfc1c2a2d3f205935f26fa774830f09faa9ae82b0f57c61431')

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
