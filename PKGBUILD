# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=turm-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="TUI for the Slurm workload manager"
arch=('x86_64' 'aarch64')
url="https://github.com/karimknaebel/turm"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/karimknaebel/turm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/turm-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/turm-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('db50f163f6e3f85e9afaecf1ab47740cc82d3a335d1d00d2b38833a0b9b05600')
sha256sums_x86_64=('b3cc08bab97635e76a0c1f11c78eefdb7902ec38e803730e12471dd1eedfd340')
sha256sums_aarch64=('456142cc18f80205bf9eecdfc138fc6c6e062409eebf5db6a42cb84bd1bf2313')

package() {
  install -Dm755 "turm" "${pkgdir}/usr/bin/turm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
