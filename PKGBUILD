# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kio-admin
pkgver=1.0.0
pkgrel=1
pkgdesc='Manage files as administrator using the admin:// KIO protocol.'
arch=($CARCH)
url="https://github.com/KDE/$pkgname"
license=(BSD GPL)
depends=(kio)
makedepends=(extra-cmake-modules)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f202211543a260f0d8db16c37d60b29e9c02f84d98f6118b64ce4e04a44ea16')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
