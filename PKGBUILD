# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-core
pkgver=0.8
pkgrel=1
pkgdesc="System components and backend of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/core"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kidletime' 'libcutefish' 'libpulse' 'libxcb' 'libxcursor' 'libxtst' 'polkit-qt5'
         'xf86-input-libinput' 'xf86-input-synaptics')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'xorg-server-devel')
source=("https://github.com/cutefishos/core/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e796e335f6465c6e68e3c533f38209206f2043f286aadd501a17180349cf4380fda604fbb32e1a13d541c34f8926785ed6a878a7bb1fb2691d546a99e82ab3ca')

build() {
  cd core-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd core-$pkgver
  make DESTDIR="$pkgdir" install
}
