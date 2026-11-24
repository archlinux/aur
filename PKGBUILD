# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=punchout-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Log time on JIRA from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/dhth/punchout"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/punchout_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/punchout_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('244049e49d6d99c96a4283ab37432058cda7b29a7fa86f2c035ab3dcebab049a')
sha256sums_aarch64=('44eaef3a23d967d5b53cf88f13e22f137ac9fea72ae8726bf44153e32befb2f3')

package() {
  install -Dm755 "punchout" "${pkgdir}/usr/bin/punchout"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
