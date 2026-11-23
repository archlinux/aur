# Maintainer: shimoxi123 <shimoxijimu@163.com>
pkgname=zorite-bin
pkgver=0.15.0
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
sha256sums_x86_64=('0df54628e5709e5e00f1cdff849641e937f57fdb55dba2e7ebeb81d70aa19f8c')
sha256sums_aarch64=('b0d5a0e163f58f99d33f50cce464287b0eaeee8878e0751e21662952daa14525')

package() {
  cp -a "$srcdir/usr/." "$pkgdir/usr/"
}
