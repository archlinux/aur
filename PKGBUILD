# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-Random-Secure
cpanauthor=FREW
pkgname='perl-math-random-secure'
pkgver='0.08'
pkgrel=2
pkgdesc='Perl Math::Random::Secure CPAN module - cryptographically-secure, cross-platform replacement for rand()'
arch=('any')
url='http://search.cpan.org/dist/${cpaname}/'
license=('GPL')
makedepends=(
    perl-moo
    perl-moose
    perl-test-sharedfork
    perl-test-warn
)
depends=(perl-any-moose
         perl-crypt-random-source
         perl-math-random-isaac
         perl-module-find)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha512sums=('456c7f8143e616acd2706a8fb04456b0ae53175156e935fe972674b49c20a0b42fdbb2aafc7bce4c4de521fb6b0697235539b37960ec961b2412f4492f6d8736')

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
