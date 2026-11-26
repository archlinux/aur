# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=durable-actors-bin
pkgver=0.20.2
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
sha256sums_x86_64=('570a960f2e9e9b51e025a3da5902430d664a598da4e4781c76e2f9cdad3c72b3')
sha256sums_aarch64=('282769550250ca85f3be6b9407610b899f50f6b86a34b9f45ceee6b8432014a6')

package() {
  install -Dm755 "durable-actors" "${pkgdir}/usr/bin/durable-actors"
  install -Dm644 "LICENSE.terse-litestream" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.terse-ltx" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
