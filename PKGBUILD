# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=run-cli-bin
pkgver=0.31.0
pkgrel=1
pkgdesc="Interactive terminal UI for Google Cloud Run"
arch=('x86_64' 'aarch64')
url="https://github.com/julienbreux/run-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/run_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/run_Linux_arm64.tar.gz")
sha256sums_x86_64=('5e7268cb88eec89f2577b4dc5f761f2521db844bdc24edcb5a934da247c7730e')
sha256sums_aarch64=('c5238fe3122c41573fbd71152ac1084c324a37bb5a118b2ce56859d7eff5ad15')

package() {
  install -Dm755 "run" "${pkgdir}/usr/bin/run"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
