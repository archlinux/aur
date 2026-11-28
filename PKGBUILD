# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=paca-bin
pkgver=0.22.1
pkgrel=1
pkgdesc="Non-profit, community-owned and free forever: an AI-native, open-source alternative to Jira, Trello, ClickUp & Monday, where humans and AI agents work as equals on the same Scrum board"
arch=('x86_64' 'aarch64')
url="https://github.com/Paca-AI/paca"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Paca-AI/paca/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/paca-acp-bridge_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/paca-acp-bridge_${pkgver}_linux_arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('0409b7c6762e2cbda3e21e711a3a859b34683ff59e2b8736364b771a6722fc12')
sha256sums_aarch64=('69d9868277b68522a5b04f61fc6e578baab01d616c5f2d4cb5831acb7ff3cd87')

package() {
  install -Dm755 "paca-acp-bridge" "${pkgdir}/usr/bin/paca-acp-bridge"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
