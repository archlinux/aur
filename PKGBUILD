# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mash-tui-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Customizable command launcher for storing and executing commands"
arch=('x86_64' 'aarch64')
url="https://github.com/dennisbergevin/mash"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'mash' 'mash-git')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mash_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mash_Linux_arm64.tar.gz")
sha256sums_x86_64=('6ae4714800f1b15080b43ffba9ec7d769c607aea4197d19174a861e0a2714a14')
sha256sums_aarch64=('fe8c749832981ff0d6040e78291d5a7d6e188073528c2027b782da23253e5fda')

package() {
  install -Dm755 "mash" "${pkgdir}/usr/bin/mash"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
