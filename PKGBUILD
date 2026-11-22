# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agent-tui-bin
pkgver=0.3.88
pkgrel=1
pkgdesc="AI DevOps agent to help you secure, deploy, and maintain production-ready infrastructure"
arch=('x86_64' 'aarch64')
url="https://github.com/stakpak/agent"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/stakpak/agent/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/stakpak-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/stakpak-linux-aarch64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('1e923d6b632e6bda743b3f48c40914f657853478647c26d0a47729a7728490c6')
sha256sums_aarch64=('8312b611b5a635ea7411555f082b0fb3b6d644f99007d2c6a1f30fc6c13e725d')

package() {
  install -Dm755 "stakpak" "${pkgdir}/usr/bin/stakpak"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
