# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zot-agent-bin
pkgver=0.4.88
pkgrel=1
pkgdesc="Lightweight coding agent harness"
arch=('x86_64' 'aarch64')
url="https://github.com/patriceckhart/zot"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'zot')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zot_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zot_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a2ff02a7abb513600dab94a2fe581932d8eaf124c251f11a2ed88ff6b3e00414')
sha256sums_aarch64=('434f3187064466882c18c65f2e0fa546306f8935fc80801fdae07ace0b3338d3')

package() {
  install -Dm755 "zot" "${pkgdir}/usr/bin/zot"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
