# Maintainer: Sean Anderson <seanga2@gmail.com>

pkgname=dh-golang
pkgver=1.62
pkgrel=1
pkgdesc="debhelper add-on for packaging software written in Go"
arch=('any')
url="https://salsa.debian.org/go-team/packages/dh-golang"
license=('GPL')
groups=()
depends=('perl>=5.10.0' debhelper dpkg)
makedepends=(perl-module-install)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$url/-/archive/debian/$pkgver/$pkgname-debian-$pkgver.tar.bz2")
sha512sums=('4a2bda2e1f3424fce45de37b36f8d2ba31df5089b6f96ce3e88db585d22af7a381dfc0f8d831be45a1d9cc4d5fb9b433bca4f50d6f7064432540b0f1548f3803')

build() {
  cd "$srcdir/$pkgname-debian-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$pkgname-debian-$pkgver"

  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
