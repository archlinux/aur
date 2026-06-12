# Maintainer: Remisa Phillips

pkgname=burning-windows
pkgver=0.1.0
pkgrel=2
pkgdesc='Burning window close animation for KDE Plasma 6 KWin Wayland'
arch=('x86_64')
url='https://aur.archlinux.org/packages/burning-windows'
license=('MIT')
depends=('kwin' 'qt6-base' 'qt6-declarative' 'kcoreaddons' 'ki18n')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools')
provides=('kwin6-effect-remisa-burn')
conflicts=('kwin6-effect-remisa-burn')
install='burning-windows.install'
source=('burning-windows-0.1.0.tar.gz')
sha256sums=('d62555eab68342f9299d6c87d7416a3b097c050caba0d7367004e5aedbf3ec0f')

build() {
    cmake -S "$srcdir/burning-windows-0.1.0" -B build         -DCMAKE_BUILD_TYPE=None         -DCMAKE_INSTALL_PREFIX=/usr         -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$srcdir/burning-windows-0.1.0/LICENSE"         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
