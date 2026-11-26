# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mirrorproxy-bin
pkgver=1.8.1
pkgrel=1
pkgdesc="Mirror and download accelerator for GitHub, Docker, npm, PyPI, Cargo and more"
arch=('x86_64' 'aarch64')
url="https://github.com/inbjo/MirrorProxy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/inbjo/MirrorProxy/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mirrorproxy-client-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mirrorproxy-client-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('d12faa744c2f445332aa3c981453269c10157d920bc433abfc9945f55b1454d8')
sha256sums_x86_64=('e72d8355d779e5dcef222a3e98e2732a0c9f7b72c7f081b2fbf5c9a90aaf0edc')
sha256sums_aarch64=('df18f547874377ea9893100a84c187bd6483558d5c581dbea68b4a3dcffdda2d')

package() {
  install -Dm755 "mirrorproxy" "${pkgdir}/usr/bin/mirrorproxy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
