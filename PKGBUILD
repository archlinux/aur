# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aisw-bin
pkgver=0.3.11
pkgrel=1
pkgdesc="Switch between multiple Claude Code, Codex and Gemini accounts"
arch=('x86_64' 'aarch64')
url="https://github.com/burakdede/aisw"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/burakdede/aisw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/aisw-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/aisw-aarch64-unknown-linux-gnu")
sha256sums=('289c2b9adb07c4ccc42e2d9b6bba18d5f6099a87f0c25b2633262754eebc34d6')
sha256sums_x86_64=('27a4f1623206b3413ed1303fc4b2ae80d1806fe11c0909bcce1671886389f023')
sha256sums_aarch64=('a2ad252f6cfca9acecfba43338246eb43935dfac1558aa6f19e0804239e03f52')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/aisw"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
