# Maintainer: Nico <d3sox at protonmail dot com>

_reponame=kwin-effects-forceblur
pkgname=kwin-effects-forceblur
pkgver=1.5.0
pkgrel=1
pkgdesc="KWin Blur effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/taj-ny/$_reponame"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy)
optdepends=("kwin-x11: for X11" "kwin: for Wayland")
makedepends=(git extra-cmake-modules qt6-tools kwin kwin-x11)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('bfb43a73d270a63c1efa4a85da4f734af7289c9d57fb1d1ed475fbb90adbd7f1')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$_reponame-$pkgver"
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

