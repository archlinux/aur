# Maintainer: username227 <username [at] gmail [dot] com> 

pkgname=sudachi-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Sudachi is a Nintendo Switch emulator for Android, Linux, macOS and Windows, written in C++"
arch=(x86_64)
url=https://github.com/sudachi-emu/sudachi/
license=(GPL-3.0-or-later)
provides=('sudachi')
provides=('sudachi')
depends=(
  brotli
  enet
  llvm-libs
  gcc-libs
  glibc
  hicolor-icon-theme
  libcrypto.so
  libssl.so
  libva.so
  lz4
  qt5-base
  qt5-multimedia
  qt5-webengine
  sdl2
  zlib 
)

source=('https://github.com/sudachi-emu/sudachi/releases/download/v1.0.1/v1.0.1-linux.7z'
         'https://raw.githubusercontent.com/sudachi-emu/sudachi/39f1a62c8d45c960c0a262d48152c41a1d5b3730/dist/sudachi.svg'
         'https://raw.githubusercontent.com/sudachi-emu/sudachi/main/dist/sudachi.desktop')
sha256sums=('79a3508a5fd1cad9593663ed83f2ac8af5f13d8f2747a71011d97befae23073f'
            '1edb61d2a01d926654fc98f8e59253df600d88ca4b2c5706a3b01368b830f31d'
            'bb0b197cfa369c713fae146e3fcdf2a758ca1436e8761aa89ffd418c88845392')

package() {
install -Dm755 $srcdir/sudachi -t "$pkgdir/usr/bin"
install -Dm755 $srcdir/sudachi-cmd -t "$pkgdir/usr/bin"
install -Dm755 $srcdir/sudachi.desktop -t "$pkgdir/usr/share/applications"
install -Dm644 $srcdir/sudachi.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
