# Maintainer: shimoxi123 <shimoxijimu@163.com>
pkgname=zorite-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="A local-first outliner and daily-journal note app (Logseq-style)."
arch=('x86_64' 'aarch64')
url="https://github.com/packetThrower/zorite"
license=('GPL-3.0-or-later')
# 上游 release.yml 用 fpm 构建的官方 Arch 包,直接重打包,无需编译
depends=(
  'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11' 'libxcb'
  'xcb-util-cursor' 'fontconfig' 'freetype2'
)
provides=('zorite')
conflicts=('zorite')
options=('!strip' '!debug')  # 预编译二进制,无调试信息,不开 split debug
source_x86_64=("https://github.com/packetThrower/zorite/releases/download/v$pkgver/zorite-$pkgver-1-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/packetThrower/zorite/releases/download/v$pkgver/zorite-$pkgver-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('bcb5adc88dc16466e48e04b2d7edfaba6f75b1757e35afa849026b9ec2e61dbb')
sha256sums_aarch64=('d9fed4d7cf6dac1ed8462506e92aa04a68bb89fa9f13a9bd01c5b5b9b072d7c1')

package() {
  cp -a "$srcdir/usr/." "$pkgdir/usr/"
}
