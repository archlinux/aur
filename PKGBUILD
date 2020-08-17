# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=qtraw
pkgver=1.1
pkgrel=1
pkgdesc="Qt image plugin for loading raw files, via libraw"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/mardy/qtraw"
license=(GPL3)
depends=(qt5-base libraw)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mardy/qtraw/archive/VERSION_${pkgver}.tar.gz")
sha256sums=('03913795a93a7e0888f1788ccb6dffe053dc29763e85a1c8c15a2a3bc447ae71')

build() {
  cd "$pkgname-VERSION_$pkgver"
  qmake KDEDIR=/usr
  make
}

package() {
  cd "$pkgname-VERSION_$pkgver"
  make install INSTALL_ROOT="${pkgdir}/"
}
