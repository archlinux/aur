# Maintainer: a821 at mail de

pkgname=litecoin-bin
pkgver=0.21.5.6
pkgrel=1
arch=('x86_64')
url="https://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency, official binary release (includes litecoin-qt and litecoind)"
source=(
  litecoin-bin.desktop
  litecoin128.png
  LICENSE
)
source_x86_64=("https://download.litecoin.org/litecoin-${pkgver}/linux/litecoin-${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums=('512d0d7de9be2736e4a2d7bf948d16b61319b2c402c032be7c4d3acc06febe16'
            'fc2fa6b980a34762a8135168a4446887223ae60b24da54253893ff517992ad94'
            'c71857544b2ea7371b4b70035a0a23ffe9691d0a07e7c9206b94be22983f5382')
sha256sums_x86_64=('3c0a217651a431ef446641669a0b74ce7dbcd9b9ed1a118fc830b8f6779ee83f')
validpgpkeys=(
  'D35621D53A1CC6A3456758D03620E9D387E55666'  # David Burkett
)
options=(!strip !debug)
depends=(
  fontconfig
  freetype2
  glibc
  libgcc
  libxcb
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin} 'litecoin-qt')

package() {
  install -Dm755 litecoin-$pkgver/bin/*litecoin* -t "$pkgdir/usr/bin"
  install -Dm644 litecoin-$pkgver/share/man/man1/litecoin* -t "$pkgdir/usr/share/man/man1"
  install -Dm644 litecoin-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 litecoin-bin.desktop "$pkgdir"/usr/share/applications/litecoin-bin.desktop
  install -Dm644 litecoin128.png "$pkgdir"/usr/share/pixmaps/litecoin128.png
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
