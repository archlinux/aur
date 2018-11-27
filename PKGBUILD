# Maintainer: Samuel Laurén <samuel.lauren@iki.fi>
pkgname=rainbowpath
pkgver=0.3
pkgrel=1
pkgdesc="Program for making paths pretty."
arch=("x86_64")
url="https://github.com/Soft/rainbowpath"
license=("MIT")
depends=()
makedepends=()
source=("https://github.com/Soft/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("3b8326816733e7a0e2a5d6088d7dea13899958533225cedef24a5e83d7606585")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -s -D -m755 -D ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -D -m644 -D man/${pkgname}.1 "$pkgdir/usr/share/man/man1/${pkgname}.1"
}

# vim:set ts=2 sw=2 et:
