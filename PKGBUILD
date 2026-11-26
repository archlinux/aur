# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=json-repair-bin
pkgver=0.0.19
pkgrel=1
pkgdesc="Repair malformed JSON from LLMs"
arch=('x86_64' 'aarch64')
url="https://github.com/RealAlexandreAI/json-repair"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jsonrepair_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/jsonrepair_Linux_arm64.tar.gz")
sha256sums_x86_64=('85c4b86d9874547264e5de34f94181aff1d06bd01a8b7ed782299a4f1f8c7c87')
sha256sums_aarch64=('4661ce57d383932864d01f561a0eca8c2f8be9e21f1edf035b87641ad01f0b1b')

package() {
  install -Dm755 "jsonrepair" "${pkgdir}/usr/bin/jsonrepair"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
