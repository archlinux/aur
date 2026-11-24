# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zmx-session-manager-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="TUI session manager for zmx"
arch=('x86_64' 'aarch64')
url="https://github.com/mdsakalu/zmx-session-manager"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zmx-session-manager_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zmx-session-manager_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8f0f94b8d7049972826536ad896e2fd06e8078e4e23c7c38031f7a259e7054c3')
sha256sums_aarch64=('3dfd76e33f50b9eec68c3c2d17cd3955cfe7b88706e4c809249b327160d91720')

package() {
  install -Dm755 "zsm" "${pkgdir}/usr/bin/zsm"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
