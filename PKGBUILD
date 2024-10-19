# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kemoticons
pkgver=5.116.0
pkgrel=2
pkgdesc='Support for emoticons and emoticons themes'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(karchive5 kservice5)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('ac63341b07fe151dcbb622495d9cfd5d42fbfc4c4e67bf915b8eec03cf626853')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
