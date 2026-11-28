# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=josim-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Superconductor circuit simulator"
arch=('x86_64' 'aarch64')
url="https://github.com/JoeyDelp/JoSIM"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/JoSIM-v${pkgver}-linux-x64-rhel6.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/JoSIM-v${pkgver}-linux-arm64-rhel7.tar.gz")
sha256sums_x86_64=('ddb1eec2d577defd20c552dbdac2bd194b4d427fc340e69c8e071b5ebbb3a17a')
sha256sums_aarch64=('2153cfbc5e7b908fcdfe6aab63366e4c60ba03d4a0afaac44175b5c73aa370e3')

package() {
  install -Dm755 "./bin/josim-cli" "${pkgdir}/usr/bin/josim-cli"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
