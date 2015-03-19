# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Swift Geek <swiftgeek «at» gmail.com>

cpaname=ExtUtils-Typemap
pkgname=perl-extutils-typemap
pkgver=1.00
pkgrel=1
pkgdesc="ExtUtils::Typemap "
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl')
source=("http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/${cpaname}-${pkgver}.tar.gz")
sha256sums=('b1b015772dbb068b93a0f6ffa02f5d94822365e6018ac5ed2bc53ca669071fc7')

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

