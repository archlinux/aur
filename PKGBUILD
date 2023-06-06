# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: M0Rf30
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=colord-kde
pkgver=23.04.2
pkgrel=1
pkgdesc="Interfaces and session daemon to colord for KDE"
arch=(x86_64)
url='https://userbase.kde.org/Color_Management'
license=(GPL)
groups=(kde-applications kde-graphics)
depends=(colord libxrandr kitemmodels kdeclarative kirigami-addons)
makedepends=(extra-cmake-modules kcmutils)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('b81f99129e3a057225ba5f19988772ce3825fea2bd8e73700f7d48d9b31bb551'
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
