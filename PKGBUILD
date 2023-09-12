# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: M0Rf30
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=colord-kde
pkgver=23.08.1
pkgrel=1
pkgdesc="Interfaces and session daemon to colord for KDE"
arch=(x86_64)
url='https://userbase.kde.org/Color_Management'
license=(GPL)
groups=(kde-applications kde-graphics)
depends=(colord libxrandr kitemmodels kdeclarative kirigami-addons)
makedepends=(extra-cmake-modules kcmutils)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('e2d754420b8997a098df788929e4290e4b6c6886e9eda596aa4c621b0b210345'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
