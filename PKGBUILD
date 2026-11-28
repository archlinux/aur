# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ask4me-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Human-in-the-loop requests for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/easychen/ask4me"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/easychen/ask4me/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ask4me-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ask4me-linux-arm64")
sha256sums=('998bc52372640f7fe4dc7d2ea11df43d60362b92145c0324d161240aa412463b')
sha256sums_x86_64=('ea85c089546b129a22db5e104508ae9c716bbce6932144ef0710de83edd18b70')
sha256sums_aarch64=('61c0554e6da2432aa5070276a4e01a1a19210e4379ad84756b22a56fc0c9b178')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ask4me"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
