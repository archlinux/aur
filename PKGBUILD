# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-view-bin
pkgver=0.46.3
pkgrel=1
pkgdesc="Monitor many Claude Code sessions at once"
arch=('x86_64' 'aarch64')
url="https://github.com/tombelieber/claude-view"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tombelieber/claude-view/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/claude-view-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/claude-view-linux-arm64.tar.gz")
sha256sums=('84bb8429236392333e09419d32ed6c5ce537d9039818c7a9cc85ffc30f6a232c')
sha256sums_x86_64=('206d826e8e3dd5a2867f9ee1bed101700617876ef2077bb3cf22c784ce4e652d')
sha256sums_aarch64=('6aa18b7e94a609ef33a1c3a701789894a010bf2f4a677cf2a12fc35d82177b0e')

package() {
  install -Dm755 "./claude-view" "${pkgdir}/usr/bin/claude-view"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
