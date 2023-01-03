# Contributor: Kirill Minligareev <seqularise@outlook.com>

pkgname=kde-inotify-survey
pkgver=1.0.0
pkgrel=1
pkgdesc='Tooling for monitoring inotify limits and informing the user when they have been or about to be reached.'
arch=(x86_64)
url='https://invent.kde.org/system/kde-inotify-survey'
license=(BSD)
depends=(kio ki18n kcoreaddons knotifications kdbusaddons kauth)
makedepends=(git extra-cmake-modules)
groups=(kde-applications)
#source=("git+https://github.com/KDE/$pkgname.git#commit=$_commit")
source=(git+https://invent.kde.org/system/$pkgname.git#tag=v1.0.0)
sha256sums=('SKIP')
validpgpkeys=('SKIP')

build() {
  cmake -B build -S $pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
