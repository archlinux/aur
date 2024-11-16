# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
_cudaversion=1210
pkgname=koboldcpp-cuda-bin
pkgver=1.78
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI, CUDA version"
arch=('x86_64')
url="https://github.com/LostRuins/${_pkgname}"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=(
  "https://github.com/LostRuins/${_pkgname}/releases/download/v$pkgver/${_pkgname}-linux-x64-cuda${_cudaversion}"
  "koboldcpp.desktop"
  "koboldcpp.png"
)
sha256sums=(
  '658cd08f36765a60299e384923cbf7e65d6779a06aa7e9f467a9eed2c1daf306'
  'fcec7b843b908e1c03496fdc0605e6509f52526a855c43db16e287ef646503ef'
  'd244788c74a693a383bea7db6ab2bb2f762e6020de900be977b16e18dcd20f54'
)

package() {
  install -D -m 0755 "${_pkgname}-linux-x64-cuda${_cudaversion}" "$pkgdir/usr/bin/${_pkgname}"
  install -D -m 0644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -D -m 0644 "$srcdir/${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
