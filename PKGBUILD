# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentfield-bin
pkgver=0.1.146
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
sha256sums_x86_64=('c810bcf623a62e1c3c9ca4c833ad543e866989e0822457024eee460c0feef0c1')
sha256sums_aarch64=('772f3a638aa5f8c77eefb5abbb8d3f890ea0f3daed7b56b79ff149f138276b24')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/agentfield"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
