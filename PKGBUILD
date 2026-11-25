# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bestsub-bin
pkgver=2.0.6
pkgrel=1
pkgdesc="Self-hosted proxy subscription manager and node tester with a web UI"
arch=('x86_64' 'aarch64')
url="https://github.com/bestruirui/BestSub"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/bestsub-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/bestsub-linux-arm64.zip")
sha256sums_x86_64=('b5ad54fd5449eac57a9a86c8b13af1cac9d041a58bfd917308c2d1b661450cc0')
sha256sums_aarch64=('e2c13202f7f4b722a8208003d0c470ed0d6353236f24e5c6103386951ecb0def')

package() {
  install -Dm755 "bestsub" "${pkgdir}/usr/bin/bestsub"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
