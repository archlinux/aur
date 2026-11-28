# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nuru-bin
pkgver=0.5.18
pkgrel=1
pkgdesc="Swahili programming language"
arch=('x86_64' 'aarch64')
url="https://github.com/NuruProgramming/Nuru"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nuru_Linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nuru_Linux_arm64.tar.gz")
sha256sums_x86_64=('3f728553aa857825b83d144680544ad5a80d7cf883431519d3e32c62ce64362d')
sha256sums_aarch64=('c4ceda33fb94bd286af286a522fea31cbde1b3163ab9cddfd1af628a07271c35')

package() {
  install -Dm755 "nuru" "${pkgdir}/usr/bin/nuru"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
