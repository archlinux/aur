# Maintainer: shimoxi123 <shimoxijimu@163.com>
pkgname=zorite-bin
pkgver=0.10.1
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
sha256sums_x86_64=('b30ea137c736f59dfa850b6653524d93c60c925544513e70726ece82c3ecc431')
sha256sums_aarch64=('4490eebddf35c6f77908853bb3bf2bcb313594a0ec889b690b4f4bf01fa33cbf')

package() {
  cp -a "$srcdir/usr/." "$pkgdir/usr/"
}
