# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ruseon-core-bin
pkgver=2.1.5
pkgrel=1
pkgdesc="Edge video infrastructure for CCTV RTSP ingest, streaming and recording"
arch=('x86_64' 'aarch64')
url="https://github.com/RUSEGAL/ruseon-core"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ruseon-core_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ruseon-core_Linux_arm64.tar.gz")
sha256sums_x86_64=('c9487440efa042d36e2cb44c98b5ecf6722ba2035cc8fd7b2185f90f579a39b7')
sha256sums_aarch64=('fb0af2ff6d45ab69766aab7464e3e97db2d69aca456c469f6a8a1f24104033a6')

package() {
  install -Dm755 "ruseon-core" "${pkgdir}/usr/bin/ruseon-core"
  install -Dm755 "ruseon-cli" "${pkgdir}/usr/bin/ruseon-cli"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
