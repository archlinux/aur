# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rf-swift-bin
pkgver=4.1.1
pkgrel=1
pkgdesc="RF toolbox that deploys radio, hardware and security tools in containers"
arch=('x86_64' 'aarch64')
url="https://github.com/PentHertz/RF-Swift"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rfswift_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rfswift_Linux_arm64.tar.gz")
sha256sums_x86_64=('902d90e83e9da8e167dadc130d34a74dadb5bb215a1138692a31899eaee07048')
sha256sums_aarch64=('189e35647700f874c55092abca8a51210b3c96d1c61833aba984395e4aafcf1b')

package() {
  install -Dm755 "rfswift" "${pkgdir}/usr/bin/rfswift"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
