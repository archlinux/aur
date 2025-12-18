# Maintainer: Guido Iodice <guido[dot]iodice[at]gmail[dot]com>

pkgname=kio-stash
pkgver=1.0
pkgrel=3
pkgdesc='A kio slave and daemon to stash discontinuous file selections'
arch=(x86_64)
url="https://www.kde.org/"
license=(GPL2)
depends=(gcc-libs
         glibc
         kcoreaddons
         kdbusaddons
         kio
         qt6-base)
makedepends=(extra-cmake-modules)
source=('git+https://invent.kde.org/utilities/kio-stash.git?commit=412b3621c41ce476e6a6fea15829bb4098d9aa79')
sha256sums=('SKIP')

build() {
  cmake -B build -S $pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
