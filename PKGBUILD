# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bootagent-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Local management tool for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/MaimoryLab/BootAgent"
license=('Apache-2.0')
depends=('glib2' 'glibc' 'gtk4' 'libsoup3' 'libx11' 'webkitgtk-6.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/MaimoryLab/BootAgent/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/ota-BootAgent-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/ota-BootAgent-linux-arm64.zip")
sha256sums=('eafb109351230ca6a3950c68e5a1988c4e0f45adf8c0429ac05b477283ba4f0c')
sha256sums_x86_64=('bbef94e68c12541d9d80f78958f433c38b775fbea9395e6dd59bbbdbc5b24829')
sha256sums_aarch64=('a8e20289e0520e315f18abad9211cfd3f8b6fbf94a0285f8091ca2c2671cfa58')

package() {
  install -Dm755 "bootagent-desktop" "${pkgdir}/usr/bin/bootagent-desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
