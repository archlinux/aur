# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-Random-Secure
cpanauthor=FREW
pkgname='perl-math-random-secure'
pkgver='0.080001'
pkgrel=5
pkgdesc='Perl Math::Random::Secure CPAN module - cryptographically-secure, cross-platform replacement for rand()'
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('GPL')
makedepends=(
    perl-moo
    perl-moose
    perl-test-sharedfork
    perl-test-warn
)
depends=(
    perl-crypt-random-source
    perl-math-random-isaac
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha512sums=('2092fc01e224ebb438f927f72e835095efdb8790d8f4ef845fc7c4af3e20a05848e7632b0e752221bbe76cebbfa8186638043457ff4f80ff5727a42baec317ce')

build() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    perl Makefile.PL
    make
}

check() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    make test
}

package() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
