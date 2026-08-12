# Maintainer: imsyy <imsyy1024@gmail.com>
pkgname=splayer-next-bin
pkgver=1.0.0
pkgrel=8
options=('!debug')
pkgdesc="A modern cross-platform music player built with Electron, Vue 3, and TypeScript"
arch=('x86_64')
url="https://github.com/SPlayer-Dev/SPlayer-Next"
license=('AGPL-3.0-only')
depends=(
  'c-ares'
  'ffmpeg'
  'gtk3'
  'http-parser'
  'libevent'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
  'libnotify'
  'libappindicator-gtk3'
)
source=("https://github.com/SPlayer-Dev/SPlayer-Next/releases/download/v${pkgver}/splayer-next-${pkgver}-x64.pacman")
sha256sums=('9647c8eb23a3aaaf4b1debbdd65cbeabd67e2f0ce12566986524c14aa636623f')

package() {
  bsdtar -xf "$srcdir/splayer-next-${pkgver}-x64.pacman" --exclude='.*' -C "$pkgdir" --no-same-permissions --no-same-owner
  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/SPlayer-Next/SPlayer-Next" "$pkgdir/usr/bin/splayer-next"
}
