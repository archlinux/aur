# Maintainer: Funami
pkgname=lux-dl-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Fast and simple video download library and CLI tool written in Go"
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'aarch64')
url="https://github.com/iawia002/lux"
license=('MIT')
depends=('ffmpeg')
provides=('lux-dl')
conflicts=('lux-dl' 'lux-go' 'annie' 'lux')
replaces=('annie-bin')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/iawia002/lux/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/iawia002/lux/releases/download/v$pkgver/lux_${pkgver}_Linux_64-bit.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::https://github.com/iawia002/lux/releases/download/v$pkgver/lux_${pkgver}_Linux_32-bit.tar.gz")
source_pentium4=("$pkgname-$pkgver-pentium4.tar.gz::https://github.com/iawia002/lux/releases/download/v$pkgver/lux_${pkgver}_Linux_32-bit.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::https://github.com/iawia002/lux/releases/download/v$pkgver/lux_${pkgver}_Linux_ARM_v6.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/iawia002/lux/releases/download/v$pkgver/lux_${pkgver}_Linux_ARM64.tar.gz")
noextract=("$pkgname-$pkgver-x86_64.tar.gz"
           "$pkgname-$pkgver-i686.tar.gz"
           "$pkgname-$pkgver-pentium4.tar.gz"
           "$pkgname-$pkgver-armv6h.tar.gz"
           "$pkgname-$pkgver-aarch64.tar.gz")
sha256sums=('84167971d27937f2786018fb023ef08bcd310ca37c0983d7385cfb64cfe4fc8c')
sha256sums_x86_64=('10c86751968a7ad6c322cb8910bc87c1cb29906c5252c5f3d1111b36c8b50680')
sha256sums_i686=('8bd6b7553425cadf89922a90350a5e2222a3752ad6081e3fa1213b0b30cef855')
sha256sums_pentium4=('8bd6b7553425cadf89922a90350a5e2222a3752ad6081e3fa1213b0b30cef855')
sha256sums_armv6h=('a1ef4547286075d7b835faf8c2c4fffbd395ed3331b6757fb80c77d24207b74f')
sha256sums_aarch64=('dba0232ec3fcc2b518f78247bf37da7cf363a22aba82b613a70b003025b4db48')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/lux-dl/LICENSE"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 lux -t "$pkgdir/usr/bin"
}
