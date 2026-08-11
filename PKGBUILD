# Maintainer: imsyy <imsyy1024@gmail.com>
pkgname=splayer-next-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="A modern cross-platform music player built with Electron, Vue 3, and TypeScript (unofficial build)"
arch=('x86_64')
url="https://splayer.imsyy.top"
license=('AGPL-3.0')
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
source=("https://github.com/K-Blaaaack/SPlayer-Next/releases/download/v${pkgver}/splayer-next-${pkgver}-x64.pacman")
sha256sums=('4c6c757b6ae4730821303ee991b1fb77565d43cd68bd84102204ab9d01e2b16c')

package() {
  bsdtar -xf "$srcdir/splayer-next-${pkgver}-x64.pacman" --exclude='.*' -C "$pkgdir" --no-same-permissions --no-same-owner
  mv "$pkgdir/opt/SPlayer-Next" "$pkgdir/opt/splayer-next" 2>/dev/null || true
  ln -sf "/opt/splayer-next/SPlayer-Next" "$pkgdir/usr/bin/splayer-next" 2>/dev/null || true
}
