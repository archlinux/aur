# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=whosthere-bin
pkgver=0.4.0
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

sha256sums_x86_64=('62e0b9c9a66b3826d38ca7e3fe0186e8b72530ce4a710af9cd95fa1b25e8445e')
sha256sums_aarch64=('c59f50276d04871aae5d7bbe8341c974f5cf51c70ecb7615e7566c6290a0f4e9')
sha256sums_i686=('a0d425b7e90290f583ca916e024d1461831ff9b6abd38250d3121a5e5e60ce73')

package() {
  # Install binary
  install -Dm755 whosthere "${pkgdir}/usr/bin/whosthere"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
