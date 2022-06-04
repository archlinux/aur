# Maintainer: Sean Anderson <seanga2@gmail.com>

pkgname=dh-golang
pkgver=1.56
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
sha512sums=('821ded7cbe147ca05282b6a2cd92e42379772436724516245a9f081fba0b08193394bacdf6d104de20f06588cbe6089b39c34adebfdbb954b6663f46c6c02753')

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
