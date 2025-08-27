# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-remotecontrollers
pkgver=5.27.12
pkgrel=1
pkgdesc='Translate various input device events into keyboard and pointer events'
arch=(any)
url='https://plasma-bigscreen.org/'
license=(GPL2)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules plasma-wayland-protocols libcec)
optdepends=('libcec: TV remotes support')
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('3b1aefc4d6bb8215db54c53d5efa8a34f0e38477925511b1e6e342a9edace9d8')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
