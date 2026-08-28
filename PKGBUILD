# Maintainer: archdub <groknok [at] gmail [dot] com>

pkgname=neoglogg
pkgver=1.1.1
pkgrel=3
pkgdesc="Fast and smart log explorer, an improved and updated version of glogg."
arch=('x86_64')
url="https://github.com/nekromoff/neoglogg"
license=('GPL-3.0-only')
depends=('qt6-base' 'boost-libs' 'hicolor-icon-theme' 'qt6-5compat')
makedepends=('git' 'boost')
source=("git+https://github.com/nekromoff/${pkgname}.git#tag=v${pkgver}")
sha512sums=('5f2a25337832af6009fbd3ab795c4b7da36dfcf0563d169df9a839e2bb735f71fec19de2615284e39f420349c522e62df2bae4bad08f7ea1e7c1e15670f4de7d') # updpkgsums

build() {
  cd $pkgname
  mkdir -p build
  cd build
  qmake6 ../neoglogg.pro
  make
}

package() {
  cd $pkgname/build
  make install INSTALL_ROOT="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
