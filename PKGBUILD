# Maintainer: Nico <d3sox at protonmail dot com>

_reponame=kwin-forceblur
pkgname=kwin-effects-forceblur
pkgver=1.1.0
pkgrel=1
pkgdesc="KWin Blur effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/taj-ny/$_reponame"
license=(GPL3)
depends=(kio knotifications kwin kcrash kglobalaccel)
makedepends=(git extra-cmake-modules qt6-tools)
source=("$pkgname::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7a9b68c28e0073520069327311be472096d65125a9bd2bd9040022a73c9d46b7')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$_reponame-$pkgver"
    make -j"$(nproc)" -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

