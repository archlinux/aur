# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bragibooks-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Self-hosted audiobook library organizer with metadata matching and m4b merging"
arch=('x86_64' 'aarch64')
url="https://github.com/djdembeck/bragibooks"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bragibooks_${pkgver}_linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bragibooks_${pkgver}_linux-arm64.tar.gz")
sha256sums_x86_64=('c2fb6e3732e372fc2b65082474c75afc9a44bd29b277ff8558f6b1431724d2c9')
sha256sums_aarch64=('d1a4fbb213b381c5dc286a8c5924bbabd507408ef0b9b4404c5ec1ca2836e313')

package() {
  install -Dm755 "bragibooks" "${pkgdir}/usr/bin/bragibooks"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
