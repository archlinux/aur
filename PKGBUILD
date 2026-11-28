# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xcrawl3r-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Recursively spider webpages for URLs"
arch=('x86_64' 'aarch64')
url="https://github.com/hueristiq/xcrawl3r"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/xcrawl3r_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/xcrawl3r_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b587f7704bba46f34d21958efa61d6c409603f40a70f095f090643df96e2723e')
sha256sums_aarch64=('e58377055fb1937374ed9549f4942897fb491f269e1175232d95f3307639e38f')

package() {
  install -Dm755 "xcrawl3r" "${pkgdir}/usr/bin/xcrawl3r"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
