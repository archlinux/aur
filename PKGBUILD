# Maintainer: Nico <d3sox at protonmail dot com>

_reponame=kwin-effects-forceblur
pkgname=kwin-effects-forceblur
pkgver=1.4.0
pkgrel=1
pkgdesc="KWin Blur effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/taj-ny/$_reponame"
license=(GPL3)
depends=(kio knotifications kcrash kglobalaccel)
optdepends=("kwin-x11: for X11" "kwin: for Wayland")
makedepends=(git extra-cmake-modules qt6-tools)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('24a7e2426cd5252336b8fe283adbc077b428158f40a51aa25c67759ce43fd0d4')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$_reponame-$pkgver"
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

