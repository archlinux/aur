# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=namespace-sweep
cpanauthor=FRIEDO
pkgname=perl-namespace-sweep
pkgver=0.006
pkgrel=2
pkgdesc="Perl namespace::sweep CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-b-hooks-endofscope'
   'perl-moo'
   'perl-moose'
   'perl-mouse'
   'perl-package-stash'
   'perl-sub-identify'
   'perl-sub-name'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('de99ce915ab0f93781580e3433d7dc9c2585a2789627173b280c6030ac0b1953')

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
