# Maintainer: Nico <d3sox at protonmail dot com>

_reponame=kwin-forceblur
pkgname=kwin-effects-forceblur
pkgver=1.1.1
pkgrel=3
pkgdesc="KWin Blur effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/taj-ny/$_reponame"
license=(GPL3)
depends=(kio knotifications kwin kcrash kglobalaccel)
makedepends=(git extra-cmake-modules qt6-tools)
source=("$url/archive/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('3c0dd195e995bc72e66fd876e59a6c422b649ee84f2da75355daa3a1616641ae')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$_reponame-$pkgver"
    make -j"$(nproc)" -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

