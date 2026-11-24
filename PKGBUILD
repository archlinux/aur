# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=joyczl-agent-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Local-first personal assistant for long-running tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/chrisvip001/joyczl-agent"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/joy-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/joy-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('2ca3179a8776ef77a249f672200c3d1cd35f6945a45c5ccb026c60fc508c3d02')
sha256sums_aarch64=('87a2a0038f6ffd3545db99408cb4088554df244f6251379c725da9d348c4889e')

package() {
  install -Dm755 "joy" "${pkgdir}/usr/bin/joy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
