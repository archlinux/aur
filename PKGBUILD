# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-settings
pkgver=0.7
pkgrel=1
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
sha512sums=('aae850652163b4cab0eab5bd74af161eaaa4a1fcbbee73620acebc69ede9fd67e26ec0fd54826a17aeeb1993faf5f69878c0d0859cb387f62cf198db1937d920')

build() {
  cd settings-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd settings-$pkgver
  make DESTDIR="$pkgdir" install
}
