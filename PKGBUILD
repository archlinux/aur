# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=true
cpanauthor=CHOCOLATE
pkgname=perl-true
pkgver=1.0.2
pkgver_v=v${pkgver}
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
   'perl-function-parameters'
   'perl-moo'
)
source=("https://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver_v}.tar.gz")
sha256sums=('6a1ccd4008d4cc66ded4e2a1694b5b2a21d7655e276e1354160012ba2be2a284')

build() {
	 cd "${srcdir}/${cpaname}-${pkgver_v}"
	 perl Makefile.PL
	 make
}

check() {
	 cd "${srcdir}/${cpaname}-${pkgver_v}"
	 make test
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver_v}"
	 make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
