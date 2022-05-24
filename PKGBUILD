# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Lexical-Accessor
cpanauthor=TOBYINK
pkgname=perl-lexical-accessor
pkgver=0.013
pkgrel=1
pkgdesc="Perl Lexical::Accessor CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
checkdepends=(
    'perl-class-tiny'
    'perl-moo'
    'perl-moose'
    'perl-mouse'
    'perl-sub-handlesvia'
)
depends=(
    'perl'
    'perl-hash-fieldhash'
    'perl-test-fatal'
    'perl-test-requires'
    'perl-type-tiny'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('1305b4db1721e064ae5d22e99afaf25a8f5c63c653511fd21f3806367bc3f961')

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
