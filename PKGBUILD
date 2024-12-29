# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname="plasma-bigscreen"
pkgver=5.27.11
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
b2sums=('7f10b7bc8da221bd229221b5fe4e5a32bcff6af0c3188c6fcf6b5ba274c9c1aaff9a5a5a2ffeb17235cc4b0b37336e4d1d9af6f4c36d4206e4a245eb2abade90')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
