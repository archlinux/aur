# Maintainer: raulfepa <raulfepa@outlook.es>

pkgname=sudachi-bin
_pkgver=v1.0.14
pkgver=1.0.14
pkgrel=1
pkgdesc="Sudachi is a Nintendo Switch emulator for Android, Linux, macOS and Windows, written in C++"
arch=(x86_64)
url=https://sudachi.emuplace.app/
license=(GPL-3.0-or-later)
provides=('sudachi')
depends=('brotli' 'enet' 'llvm-libs' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libcrypto.so' 'libssl.so' 'libva.so' 'lz4' 'qt6-base' 'qt6-multimedia' 'qt6-webengine' 'sdl2' 'zlib')
optdepends=('qt6-wayland: wayland support')
source=("https://github.com/emuplace/sudachi.emuplace.app/releases/download/${_pkgver}/sudachi-linux-${_pkgver}.7z"
        "sudachi.svg"
        "sudachi.desktop")
sha256sums=('017e986ab1084fbdfab196961101894663aa8ccd77cf9968dd9bdb9ecf3ec4f1'
            '1edb61d2a01d926654fc98f8e59253df600d88ca4b2c5706a3b01368b830f31d'
            '0081f2b36ef69abfc328e11cfae2dd83ed74695bfec0f04938ad80b6f5200708')

package() {
    install -Dm755 $srcdir/sudachi -t "$pkgdir/usr/bin"
    install -Dm755 $srcdir/sudachi-cmd -t "$pkgdir/usr/bin"
    install -Dm755 $srcdir/sudachi-room -t "$pkgdir/usr/bin"
    install -Dm755 $srcdir/sudachi.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 $srcdir/sudachi.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
