# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=action-validator-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Validate GitHub Action and workflow YAML files"
arch=('x86_64' 'aarch64')
url="https://github.com/mpalmer/action-validator"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mpalmer/action-validator/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/action-validator_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/action-validator_linux_arm64")
sha256sums=('8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
sha256sums_x86_64=('9f42f94fca5b8d04c13bccfbb331104b37a9250650d89ae58dc888d46206f9b9')
sha256sums_aarch64=('0fe137986e838c68f760d9a60569cf6749192fa6315915f19ba0c7d11d8e3d9a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/action-validator"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
