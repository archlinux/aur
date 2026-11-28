# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cliare-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Measure how ready a CLI is for AI agents, with CI scorecards"
arch=('x86_64' 'aarch64')
url="https://github.com/modiqo/cliare"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cliare-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cliare-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('67413cb2cfcd70e4d61ed557c4d674a1e51d6006c2b75d5b4481e8827994c5c6')
sha256sums_aarch64=('6340b5acddf857d4af5b509f51ddec003bfa5fbce9115af56cd898aca01b1b22')

package() {
  install -Dm755 "./cliare" "${pkgdir}/usr/bin/cliare"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
