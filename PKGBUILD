# Maintainer: Samuel Laurén <samuel.lauren@iki.fi>
pkgname=rainbowpath
pkgver=0.2
pkgrel=1
pkgdesc="Program for making paths pretty."
arch=("x86_64")
url="https://github.com/Soft/rainbowpath"
license=("MIT")
depends=()
makedepends=()
source=("https://github.com/Soft/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("192cadae75212e814b855f2ed6b87b49614fc0da590c52c2942607c39cad350c")

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
