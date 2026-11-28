# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=skupper-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Virtual application network for hybrid cloud communication"
arch=('x86_64' 'aarch64')
url="https://github.com/skupperproject/skupper"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/skupperproject/skupper/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/skupper-cli-${pkgver}-linux-amd64.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/skupper-cli-${pkgver}-linux-arm64.tgz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('cfca46b9602c3766d3485505fdcd5a2d8883d4859550f640941d9f5c0fb13cab')
sha256sums_aarch64=('bb88462657a6ac64d099edd0c4b77d6268390dfcf235f526457b235186f5ce8f')

package() {
  install -Dm755 "skupper" "${pkgdir}/usr/bin/skupper"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
