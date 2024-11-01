# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
pkgname=koboldcpp-bin
pkgver=1.77
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI"
arch=('x86_64')
url="https://github.com/LostRuins/${_pkgname}"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=(
  "https://github.com/LostRuins/${_pkgname}/releases/download/v$pkgver/${_pkgname}-linux-x64-nocuda"
  "koboldcpp.desktop"
  "koboldcpp.png"
)
sha256sums=(
  '73d5c9cf7056a88df0df9dfd95038ce1d3b3f75c0bb166435c9df12552a1406e'
  'fcec7b843b908e1c03496fdc0605e6509f52526a855c43db16e287ef646503ef'
  'd244788c74a693a383bea7db6ab2bb2f762e6020de900be977b16e18dcd20f54'
)

package() {
  install -D -m 0755 "${_pkgname}-linux-x64-nocuda" "$pkgdir/usr/bin/${_pkgname}"
  install -D -m 0644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -D -m 0644 "$srcdir/${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
