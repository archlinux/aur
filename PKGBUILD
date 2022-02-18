# Maintainer: Funami
pkgname=lux-dl-bin
pkgver=0.13.0
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
sha256sums_x86_64=('ef3644c1d771ee74425d677dc8e446f6338cb6572f2e0d6a3b84223fdac3cc11')
sha256sums_i686=('eb18ae15fef7cd7ebe2c4492bf731faeb9069e32990cec1b464493ed9bc248bd')
sha256sums_pentium4=('eb18ae15fef7cd7ebe2c4492bf731faeb9069e32990cec1b464493ed9bc248bd')
sha256sums_armv6h=('3fc1a6f5586edc2ac08a8d29d1c7ab9db1bcdc61c3eb5bbbd032ea4a03f880a5')
sha256sums_aarch64=('950c2cc287f0757e9e1fe68885b13ce7756ed5984f257112f352eb748b781f72')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/lux-dl/LICENSE"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 lux -t "$pkgdir/usr/bin"
}
