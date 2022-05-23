# Maintainer: Shatur <genaloner@gmail.com>

pkgname=optimus-manager-qt-kde
pkgver=1.6.9
pkgrel=1
pkgdesc='A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu KDE'
arch=(x86_64)
url=https://github.com/Shatur/optimus-manager-qt
license=(GPL3)
conflicts=(optimus-manager-qt)
depends=(qt5-base qt5-svg qt5-x11extras 'optimus-manager>=1.4' knotifications kiconthemes)
makedepends=(qt5-tools extra-cmake-modules)
source=(optimus-manager-qt-$pkgver.tar.gz::$url/releases/download/$pkgver/optimus-manager-qt-$pkgver-source.tar.gz)
sha256sums=(0786bdd6ac81943a8fa4432f8406028488eaaf81c33d9e754907bf40a492f901)

build() {
  mkdir -p optimus-manager-qt-$pkgver/build
  cd optimus-manager-qt-$pkgver/build

  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" -D WITH_PLASMA=ON ..
  cmake --build .
}

package() {
  cd optimus-manager-qt-$pkgver/build

  cmake --install .
  rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
