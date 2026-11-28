# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=squealer-bin
pkgver=1.2.12
pkgrel=1
pkgdesc="Scan git repositories for leaked secrets"
arch=('x86_64' 'aarch64')
url="https://github.com/owenrumney/squealer"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/owenrumney/squealer/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/squealer.linux.amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/squealer.linux.arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('3dbf2e0ad2e3d6a68f24d09e513692d1280affdae7115a80d6dad4a6fd7462aa')
sha256sums_aarch64=('04beb6051c670c3e634c7d52243425b0929a2e1a0e31b26c0920d7b3a9745d8a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/squealer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
