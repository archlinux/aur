# Maintainer: Nico <d3sox at protonmail dot com>

_reponame=kwin-effects-forceblur
pkgname=kwin-effects-forceblur
pkgver=1.2.0
pkgrel=1
pkgdesc="KWin Blur effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/taj-ny/$_reponame"
license=(GPL3)
depends=(kio knotifications kwin kcrash kglobalaccel)
makedepends=(git extra-cmake-modules qt6-tools)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('96d2c9ef791fe66291024bc234c0543f9eeda269c62fe4e40c923c0d9dbdca08')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$_reponame-$pkgver"
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

