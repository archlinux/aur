# Maintainer: dz-vadim <dziuba.vadym@gmail.com>

pkgname=pictoblox-bin
pkgver=9.0.0
pkgrel=1
pkgdesc="PictoBlox STEM coding platform"
arch=('x86_64')
url="https://thestempedia.com/product/pictoblox/download-pictoblox/"
license=('unknown')

depends=(
  'gtk3'
  'nss'
  'alsa-lib'
  'libxss'
  'libxtst'
  'libnotify'
  'libappindicator-gtk3'
  'libx11'
  'glib2'
)

makedepends=('binutils')
options=('!strip')
install="${pkgname}.install"

source=(
  "PictoBlox-Setup-${pkgver}.deb::https://download.pictoblox.ai/linux/PictoBlox-Setup-9.0.0.deb"
  "pictoblox.desktop"
  "pictoblox.png::https://play-lh.googleusercontent.com/lZzyTE3W9T9qNSdGG8Z3RA0GzlU5bX5hSYrcw6tfu2uK1Wf_9eqV-x-aJ0WMnVe1DQ"
)

sha256sums=('9ee31657e96933633f0ced1ae77ccfcff9c038eb1715f96bc87fff35bde31ba9'
            '8d86488827d98b0a924c110d16331d37826f0a5f638f4cee0c2bdfd520c48ca6'
            '2f16f4f6d67785986b02219af30e16fac60857895f117d8d0ca97344b6160ffe')

package() {
  cd "$srcdir"

  ar x "PictoBlox-Setup-${pkgver}.deb"
  tar -xf data.tar.xz -C "$pkgdir"

  install -Dm644 pictoblox.desktop \
    "$pkgdir/usr/share/applications/pictoblox.desktop"

  install -Dm644 pictoblox.png \
    "$pkgdir/usr/share/pixmaps/pictoblox.png"
}
