# Maintainer: gee

pkgname=higan-bsnes
pkgver=107.1
pkgverR=107r1
pkgrel=1
pkgdesc='Nintendo SNES emulator, faster flavor of higan'
arch=('x86_64')
url='http://byuu.org/'
license=('GPL3')
depends=('alsa-lib' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2'
         'gtksourceview2' 'libao' 'libgl' 'libpulse' 'libx11' 'libxext' 'libxv'
         'openal' 'pango' 'sdl'
         'libudev.so')
conflicts=('bsnes' 'bsnes-classic')
source=("https://download.byuu.org/bsnes_v${pkgverR}-source.7z")
sha256sums=('8649491111ecf257daec4637d7c238ebed534860a16bcfa139d7bca4c2629fbf')

build() {
  cd bsnes_v${pkgverR}-source

  make -C higan target=bsnes
}

package() {
  cd bsnes_v${pkgverR}-source

  install -Dm 755 higan/out/bsnes -t "${pkgdir}"/usr/bin/
  install -Dm 644 higan/target-bsnes/resource/bsnes.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 higan/target-bsnes/resource/bsnes.png -t "${pkgdir}"/usr/share/pixmaps/
}
