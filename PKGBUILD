# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Lexical-Accessor
cpanauthor=TOBYINK
pkgname=perl-lexical-accessor
pkgver=0.008
pkgrel=1
pkgdesc="Perl Lexical::Accessor CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-hash-fieldhash'
   'perl-test-requires'
   'perl-type-tiny'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('acb7d9baee83291f3bb6debb9a564f8065cebc32b0cf34586dca1b94c6fbf579')

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
