# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-hash-defhash
pkgver=0.071
pkgrel=1
pkgdesc="Manipulate defhash"
arch=('any')
url="https://github.com/perlancar/perl-Hash-DefHash"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-string-trim-more')
checkdepends=('perl-test-exception')
source=("https://www.cpan.org/modules/by-module/Hash/Hash-DefHash-${pkgver}.tar.gz")
sha512sums=('0ab03b03f3269e4afa5027335cfbae5cf24023762268eebdbff6e086bb7c5cf2089b96cf7ee69b400afa29b98212d9441701a297a8c9cc5ac76267cf764d92cf')

build() {
  cd "${srcdir}/Hash-DefHash-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Hash-DefHash-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Hash-DefHash-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
