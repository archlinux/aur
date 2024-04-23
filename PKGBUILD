# Maintainer: Funami
pkgname=lux-dl-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="Fast and simple video download library and CLI tool written in Go"
arch=('x86_64' 'i686' 'armv6h' 'aarch64')
url="https://github.com/iawia002/lux"
license=('MIT')
depends=('ffmpeg')
provides=('lux-dl')
conflicts=('lux-dl' 'lux-go' 'annie' 'lux')
replaces=('annie-bin')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/iawia002/lux/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/iawia002/lux/releases/download/v$pkgver/lux_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::https://github.com/iawia002/lux/releases/download/v$pkgver/lux_${pkgver}_Linux_i386.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::https://github.com/iawia002/lux/releases/download/v$pkgver/lux_${pkgver}_Linux_armv6.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/iawia002/lux/releases/download/v$pkgver/lux_${pkgver}_Linux_arm64.tar.gz")
noextract=("$pkgname-$pkgver-x86_64.tar.gz"
           "$pkgname-$pkgver-i686.tar.gz"
           "$pkgname-$pkgver-armv6h.tar.gz"
           "$pkgname-$pkgver-aarch64.tar.gz")
sha256sums=('84167971d27937f2786018fb023ef08bcd310ca37c0983d7385cfb64cfe4fc8c')
sha256sums_x86_64=('59c80b75733d3d4c8b661aacd2dfda4c8542f0d7c477dcc33884a8bc11f037a3')
sha256sums_i686=('82c9179cfaf890e08a79070cc47f1e24c978f3bff9c4386d8c01a6937866af20')
sha256sums_armv6h=('55654879ccc4452374e12dab3df5c6caa4401627e870941696c339be0e4402b5')
sha256sums_aarch64=('3cd12b23dd646b0bef61ccf3835b16bfc0a51ef9d7d8cba8eb6dc3cbd73eb692')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/lux-dl/LICENSE"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 lux -t "$pkgdir/usr/bin"
}
