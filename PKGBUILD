# Maintainer: imsyy <imsyy1024@gmail.com>
pkgname=splayer-next-bin
pkgver=1.0.0
pkgrel=1
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
sha256sums=('7fda6ec459937e07f1b7e3346990e482a2d22809a37159a21f0b8971f8945a41')

package() {
  bsdtar -xf "$srcdir/splayer-next-${pkgver}-x64.pacman" --exclude='.*' -C "$pkgdir" --no-same-permissions --no-same-owner
  mv "$pkgdir/opt/SPlayer-Next" "$pkgdir/opt/splayer-next" 2>/dev/null || true
  ln -sf "/opt/splayer-next/SPlayer-Next" "$pkgdir/usr/bin/splayer-next" 2>/dev/null || true
}
