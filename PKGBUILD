# Maintainer: Nathan Simmonds <arch@nsimmonds.com>
# Maintainer: Axel Navarro <navarroaxel at gmail.com>
pkgname=plasma5-applets-kde-arch-update-notifier
_pkgname=kde-arch-update-plasmoid
pkgver=7.2.1
pkgrel=1
pkgdesc="A KDE plasmoid for your system tray notifying you of available updates with AUR Support"
url="https://github.com/I-Dream-in-Code/$_pkgname"
arch=('any')
license=('GPL')
depends=("fakeroot" "konsole" "pacman-contrib" "plasma-desktop" "plasma-framework" "qt5-xmlpatterns")
optdepends=("checkupdates-aur" "snapd" "yakuake")
makedepends=("cmake" "git" "extra-cmake-modules")
conflicts=(plasma5-applets-kde-arch-update-notifier-git)
replaces=(plasma5-applets-kde-arch-update-notifier-git)
backup=()
install=
source=("$url/archive/$pkgver.tar.gz")

sha256sums=('7c367f7fd961daf01cca0fa5a90601f5f5f2cb6664a6102a9c8902e607a12063')

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
