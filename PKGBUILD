# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dingtalk-workspace-cli-bin
pkgver=1.0.69
pkgrel=1
pkgdesc="DingTalk Workspace is an officially open-sourced cross-platform CLI tool from DingTalk"
arch=('x86_64' 'aarch64')
url="https://github.com/DingTalk-Real-AI/dingtalk-workspace-cli"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dws-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dws-linux-arm64.tar.gz")
sha256sums_x86_64=('567257be28c1ccce4f424fc92969f9c21dd15ed600a86c252adbc35821bf7c4a')
sha256sums_aarch64=('4a8fdb369527abbb4bcf90ebf79c5e329a2021c2608491f71a610ef3a67a9797')

package() {
  install -Dm755 "./dws" "${pkgdir}/usr/bin/dws"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
