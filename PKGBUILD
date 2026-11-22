# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cctrail-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Active time, tokens and estimated cost per project from the local history of Claude Code, Codex, pi"
arch=('x86_64' 'aarch64')
url="https://github.com/vladkens/cctrail"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cctrail-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cctrail-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('68aa3919831ac3e362efd15deffa3fcc69c1d32593760eb39d7f4454b7a29928')
sha256sums_aarch64=('4139e1449f35742f9681890c2f288b158848daf50b97eccc7b79faab61eb46fc')

package() {
  install -Dm755 "cctrail" "${pkgdir}/usr/bin/cctrail"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "readme.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
