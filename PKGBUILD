# Maintainer: Funami
pkgname=annie-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A fast, simple and clean video downloader written in Go"
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'aarch64')
url="https://github.com/iawia002/annie"
license=('MIT')
provides=('annie')
conflicts=('annie')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/iawia002/annie/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/iawia002/annie/releases/download/v$pkgver/annie_${pkgver}_Linux_64-bit.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::https://github.com/iawia002/annie/releases/download/v$pkgver/annie_${pkgver}_Linux_32-bit.tar.gz")
source_pentium4=("$pkgname-$pkgver-pentium4.tar.gz::https://github.com/iawia002/annie/releases/download/v$pkgver/annie_${pkgver}_Linux_32-bit.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::https://github.com/iawia002/annie/releases/download/v$pkgver/annie_${pkgver}_Linux_ARM_v6.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/iawia002/annie/releases/download/v$pkgver/annie_${pkgver}_Linux_ARM64.tar.gz")
noextract=("$pkgname-$pkgver-x86_64.tar.gz"
           "$pkgname-$pkgver-i686.tar.gz"
           "$pkgname-$pkgver-pentium4.tar.gz"
           "$pkgname-$pkgver-armv6h.tar.gz"
           "$pkgname-$pkgver-aarch64.tar.gz")
sha256sums=('84167971d27937f2786018fb023ef08bcd310ca37c0983d7385cfb64cfe4fc8c')
sha256sums_x86_64=('ef247b2e5d318c55657446260e2663908ec8d77677c22ca71aec74384c65c880')
sha256sums_i686=('baca6ae405c67c4854e43d4a323994a9343f4dda0727f7b604cbac83fa538acf')
sha256sums_pentium4=('baca6ae405c67c4854e43d4a323994a9343f4dda0727f7b604cbac83fa538acf')
sha256sums_armv6h=('e3d614fb4232cef2a6a44949b9f7a07cbfaaea604f1faccd4441d26aed100133')
sha256sums_aarch64=('828a710321d1b74774d34132b38b480b18a3e8b5d901755678ca8724261470ef')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  /usr/bin/bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/annie/LICENSE"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 annie -t "$pkgdir/usr/bin"
}
