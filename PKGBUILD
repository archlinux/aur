# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentfield-bin
pkgver=0.1.147
pkgrel=1
pkgdesc="Build, run and scale AI agents like API and microservices"
arch=('x86_64' 'aarch64')
url="https://github.com/Agent-Field/agentfield"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Agent-Field/agentfield/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/agentfield-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/agentfield-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('7ae0613ec6ce30ee7b350952863da3d78c544e0db9157cff3d8cd764b7b4583f')
sha256sums_aarch64=('f99bc2a01ba3b08f9af0b3c38918b8208257f11874ee129b61a1d4f223e3199d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/agentfield"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
