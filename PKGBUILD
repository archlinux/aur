# Maintainer: Nico <d3sox at protonmail dot com>

_reponame=kwin-effects-forceblur
pkgname=kwin-effects-forceblur
pkgver=1.1.2
pkgrel=1
pkgdesc="KWin Blur effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/taj-ny/$_reponame"
license=(GPL3)
depends=(kio knotifications kwin kcrash kglobalaccel)
makedepends=(git extra-cmake-modules qt6-tools)
source=("$url/archive/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('44b73b955c17abb8f494941ea38df79d50299bc6679a86bd1701cf5454579626')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$_reponame-$pkgver"
    make -j"$(nproc)" -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

