# Maintainer: Funami
pkgname=lux-dl-bin
pkgver=0.12.0
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
sha256sums_x86_64=('9800251b980a76b6a57f041947e7c7738c760e29894065d4df96edba09d3d79c')
sha256sums_i686=('b066cf5855942bcbe0bce754c711696484b54605e74d51b2440a648ae78e6a56')
sha256sums_pentium4=('b066cf5855942bcbe0bce754c711696484b54605e74d51b2440a648ae78e6a56')
sha256sums_armv6h=('73545536c2561ac94d7c8a421d7d58e353eb9cc12be28438a37cea01c1db68d3')
sha256sums_aarch64=('5721ab938c62d9199bc1a1721ab2939849dc35b089a179fc3ca7c3702babeb89')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/lux-dl/LICENSE"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 lux -t "$pkgdir/usr/bin"
}
