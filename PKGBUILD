# Maintainer: Mark <speedorama1 at gmail dot com>

pkgname=koboldcpp-bin
pkgver=1.105.2
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=(
	"$pkgname-$pkgver::https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/koboldcpp-linux-x64-nocuda"
	"koboldcpp.desktop"
	"koboldcpp.png"
)
sha256sums=(
  'a14beff05f75fc1e1e02d731861f7e57f1e3245f536632202733f295c630a07f'
  'fcec7b843b908e1c03496fdc0605e6509f52526a855c43db16e287ef646503ef'
  'd244788c74a693a383bea7db6ab2bb2f762e6020de900be977b16e18dcd20f54'
)

package() {
  install -D -m 0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/koboldcpp"
  install -D -m 0644 "$srcdir/koboldcpp.desktop" "$pkgdir/usr/share/applications/koboldcpp.desktop"
  install -D -m 0644 "$srcdir/koboldcpp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/koboldcpp.png"
}
