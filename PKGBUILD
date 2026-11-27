# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dingtalk-workspace-cli-bin
pkgver=1.0.70
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
sha256sums_x86_64=('b3273c91b23d7f300c5b1dae0a6737919fffc2badd3a9834de3289d3e89cdb81')
sha256sums_aarch64=('b5631700e7c86f88fdfcb9278aa28ca83577832991089a23cf77968e414d02b8')

package() {
  install -Dm755 "./dws" "${pkgdir}/usr/bin/dws"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
