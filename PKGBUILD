# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-launcher
pkgver=0.2
pkgrel=1
pkgdesc="CutefishOS's full-screen application launcher"
arch=('x86_64')
url="https://github.com/cutefishos/launcher"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kwindowsystem' 'libcutefish')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/launcher/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f2b71790cd67aa4d5321a884c6b2c4171791b294caba048909ad995f139137fbc574a3a8a510b686a59c6ef229bd3e59452769697a0d0f506541b8274147b80b')

build() {
  cd launcher-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd launcher-$pkgver
  make DESTDIR="$pkgdir" install
}
