# Maintainer: Funami
pkgname=lux-dl-bin
pkgver=0.21.0
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
sha256sums_x86_64=('969270f04ca1a9d7c8b12d80fce3c048d21912dd831f1283257b73dc40c867dc')
sha256sums_i686=('762953ad02315dd4347bc83a951fedccf4fa37045188321a9b462e3a100746fa')
sha256sums_armv6h=('96e3f01f4126ab802986bf1b5a3e3110a58d3a2df4f2d52f360b56e3935744a6')
sha256sums_aarch64=('c52d646c4f7a4dfad6f78c1c2d174ef1852140bd423a4e37f45dd9827ba7de5f')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/lux-dl/LICENSE"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 lux -t "$pkgdir/usr/bin"
}
