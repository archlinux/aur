# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sprocket-bin
pkgver=0.34.1
pkgrel=1
pkgdesc="Bioinformatics workflow engine for WDL"
arch=('x86_64' 'aarch64')
url="https://github.com/stjude-rust-labs/sprocket"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'openssl-3' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/stjude-rust-labs/sprocket/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sprocket-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sprocket-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7a655546058e1099a447bb59a6f6128eb1b62fc0852b5f5daa89a43f891579d6')
sha256sums_x86_64=('7f55df97d455ae9f16ea369cb4216258704c39705e10958d9de855424f8ee805')
sha256sums_aarch64=('9236cc2b5e89c59d74f1daf5246b599ce5a1c8efcd88d457090271693fa1e7f0')

package() {
  install -Dm755 "sprocket" "${pkgdir}/usr/bin/sprocket"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
