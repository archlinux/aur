# Maintainer: archdub <groknok [at] gmail [dot] com>

pkgname=neoglogg
pkgver=1.3
pkgrel=1
pkgdesc="Fast and smart log explorer, an improved and updated version of glogg."
arch=('x86_64')
url="https://github.com/nekromoff/neoglogg"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-5compat' 'boost-libs' 'hicolor-icon-theme')
makedepends=('git' 'boost')
source=("git+https://github.com/nekromoff/${pkgname}.git#tag=v${pkgver}")
# use updpkgsums to update sha512sums
sha512sums=('b2e0e9a0efa02e861a6ba569e541bb04f746ff5c91e2992b7fcb3e656682d42a91c694272ab59e5407bc8e54dffbacf85254fd7540286c44f8602b10b1c8b1f0')

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
