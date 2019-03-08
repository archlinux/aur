# Maintainer: gee

pkgname=higan-bsnes
pkgver=107
pkgrel=2
pkgdesc='Nintendo SNES emulator, faster flavor of higan'
arch=('x86_64')
url='http://byuu.org/'
license=('GPL3')
depends=('alsa-lib' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2'
         'gtksourceview2' 'libao' 'libgl' 'libpulse' 'libx11' 'libxext' 'libxv'
         'openal' 'pango' 'sdl'
         'libudev.so')
conflicts=('bsnes' 'bsnes-classic')
source=("https://download.byuu.org/bsnes_v${pkgver}-source.7z")
sha256sums=('7b7fa745ce593f9912ce116bdf009cd2e70eb034cd7186264c4abedb87a5da36')

build() {
  cd bsnes_v${pkgver}-source

  make -C higan target=bsnes
}

package() {
  cd bsnes_v${pkgver}-source

  install -Dm 755 higan/out/bsnes -t "${pkgdir}"/usr/bin/
  install -Dm 644 higan/target-bsnes/resource/bsnes.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 higan/target-bsnes/resource/bsnes.png -t "${pkgdir}"/usr/share/pixmaps/
}
