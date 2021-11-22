# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-settings
pkgver=0.4
pkgrel=3
pkgdesc="System Settings application for Cutefish Desktop"
arch=('x86_64')
url="https://github.com/cutefishos/settings"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'fontconfig' 'freetype2' 'icu' 'kcoreaddons' 'libxcursor'
         'modemmanager-qt' 'networkmanager-qt'
         # qml:
         'bluez-qt' 'bluedevil' 'libcutefish' 'qt5-quickcontrols')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/settings/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9864e522fd64d58a53ce1bbe2a7c810709d74fd729f70c029429912c6608f0435c8faad32db4a289bb68ca90af55e8f882407940475e654c93dc77ad90293cef')

build() {
  cd settings-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd settings-$pkgver
  make DESTDIR="$pkgdir" install
}
