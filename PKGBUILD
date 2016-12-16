# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=true
cpanauthor=CHOCOLATE
pkgname=perl-true
pkgver=0.18
pkgrel=1
pkgdesc="Perl true CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-b-hooks-op-annotation'
   'perl-b-hooks-op-check'
   'perl-devel-stacktrace'
   'perl-extutils-depends'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('ff3d041eb2a522ec6194d7a3888325e8a3ef2238ab51452f0b547696be0b4594')

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
