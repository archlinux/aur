# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zot-agent-bin
pkgver=0.4.91
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
sha256sums_x86_64=('dcb7a99f491a6365c6891716ad079550e1ffd5b1192a20fb95a6e4d86436cab8')
sha256sums_aarch64=('6cbe4eca7a9d8b134ed538a34d98f64b8377ca08c660a33a23310bdd274b5279')

package() {
  install -Dm755 "zot" "${pkgdir}/usr/bin/zot"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
