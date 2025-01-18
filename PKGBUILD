# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
pkgname=koboldcpp-cuda-bin
pkgver=1.82
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI, CUDA version"
arch=('x86_64')
url="https://github.com/LostRuins/${_pkgname}"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=(
  "https://github.com/LostRuins/${_pkgname}/releases/download/v$pkgver/koboldcpp-linux-x64-cuda1210"
  "koboldcpp.desktop"
  "koboldcpp.png"
)
sha256sums=(
  'a4f5f2576854c1f9d8b9c979b22456a061a71e6ed4aaec52ebb83e02a870bcb4'
  'fcec7b843b908e1c03496fdc0605e6509f52526a855c43db16e287ef646503ef'
  'd244788c74a693a383bea7db6ab2bb2f762e6020de900be977b16e18dcd20f54'
)

package() {
  install -D -m 0755 "koboldcpp-linux-x64-cuda1210" "$pkgdir/usr/bin/${_pkgname}"
  install -D -m 0644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -D -m 0644 "$srcdir/${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
