# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=durable-actors-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="Open-source alternative to Cloudflare Durable Objects"
arch=('x86_64' 'aarch64')
url="https://github.com/TerseAI/durable-actors"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/durable-actors-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/durable-actors-linux-arm64.tar.gz")
sha256sums_x86_64=('69a9874769638d012779a000017cdb2918a4ba76d51f820864c34a824b1fa64c')
sha256sums_aarch64=('550d0b36f1bdf42fe5f75ceedd19360e58e774f3b0c2a2a3e2742d1795418174')

package() {
  install -Dm755 "durable-actors" "${pkgdir}/usr/bin/durable-actors"
  install -Dm644 "LICENSE.terse-litestream" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.terse-ltx" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
