# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=whosthere-bin
pkgver=0.2.1
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

sha256sums_x86_64=('138cf730c9bf55f3381e7a1cf5f1431b2887874d97902de45c074a3e2f687d50')
sha256sums_aarch64=('232e2dbefc96d0553a38d4b175e37a4458ed343d3a28be7a4299b513329d2ef5')
sha256sums_i686=('47b090409a4eef19c4969dc34722eec65b308706dc0fe6a845c8694afdd2f729')

package() {
  # Install binary
  install -Dm755 whosthere "${pkgdir}/usr/bin/whosthere"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
