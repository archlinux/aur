# Maintainer: archdub <groknok [at] gmail [dot] com>

pkgname=neoglogg
pkgver=1.1.1
pkgrel=1
pkgdesc="Fast and smart log explorer, an improved and updated version of glogg."
arch=('x86_64')
url="https://github.com/nekromoff/neoglogg"
license=('GPL-3.0-only')
depends=('qt6-base' 'boost-libs' 'hicolor-icon-theme' 'qt6-5compat')
makedepends=('boost')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nekromoff/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7a5049796fe347c743cc4793c99ae4a68e1219ae6f90153081d09075767a320539b28df3f3ed5bcfcab1c7ebc579f3ac088cfdf33cff8c74d31d75943bcae91d')

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  qmake6 ../neoglogg.pro
  make
}

package() {
  cd $pkgname-$pkgver/build
  make install INSTALL_ROOT="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
