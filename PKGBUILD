# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=whosthere-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Local Area Network discovery tool with a modern Terminal User Interface"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ramonvermeulen/whosthere"
license=('MIT')
provides=('whosthere')
conflicts=('whosthere')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/ramonvermeulen/whosthere/releases/download/v${pkgver}/whosthere_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/ramonvermeulen/whosthere/releases/download/v${pkgver}/whosthere_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::https://github.com/ramonvermeulen/whosthere/releases/download/v${pkgver}/whosthere_${pkgver}_linux_386.tar.gz")

sha256sums_x86_64=('5abfe0b060da22299102d2c62f928a99dea5b00046bc725c1448fa94980571d1')
sha256sums_aarch64=('c2818763a04fd197616588104b156c4de98000d905a52690e6841dc954e807b6')
sha256sums_i686=('d8fc789edfd95fc96ba48320615e51a74001e6d28fd8572f6bf1b7d0be43851f')

package() {
  # Install binary
  install -Dm755 whosthere "${pkgdir}/usr/bin/whosthere"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
