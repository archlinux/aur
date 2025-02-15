# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname="plasma-bigscreen"
pkgver=5.27.12
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plasma shell for TVs'
arch=(x86_64)
url='https://plasma-bigscreen.org/'
license=(GPL2)
depends=(plasma-pa plasma-nm plasma-nano plasma-settings kdeconnect qt5-virtualkeyboard plasma-remotecontrollers kwayland5 plasma-framework5 kactivities-stats5 kcmutils5)
makedepends=(extra-cmake-modules)
optdepends=('aura-browser: web browser' 'plank-player: media player')
source=("https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz")
b2sums=('6c36233e24024db92ab380cb6b459907d55c44d79c74d6e034568b7969c33105a27896552f5846210cfeb162325c103a4c41514c228c8174f5b63c4fa4debf7c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
