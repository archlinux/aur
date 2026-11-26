# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mindwalk-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Replay coding-agent sessions on a 3D map of your codebase"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmtrek/mindwalk"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mindwalk_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mindwalk_linux_arm64.tar.gz")
sha256sums_x86_64=('e9442b9261bcec3d76f4f044a0f95f52ebb32dba0f059587579bab9af6e63b20')
sha256sums_aarch64=('a3991e00e0df984704524dea174293576dbc1d6cfba84ff3afb4898005878b4f')

package() {
  install -Dm755 "mindwalk" "${pkgdir}/usr/bin/mindwalk"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
