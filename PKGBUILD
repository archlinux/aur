# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hive-tui-bin
pkgver=0.75.0
pkgrel=1
pkgdesc="TUI for managing multiple AI agent sessions in isolated git environments"
arch=('x86_64' 'aarch64')
url="https://github.com/colonyops/hive"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'hive-bin')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/hive_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/hive_Linux_arm64.tar.gz")
sha256sums_x86_64=('fa6b51a11b718cbac7432b50a29298df427acee801cdd34101c318e76e559ef4')
sha256sums_aarch64=('34be0b6272e7a5ac531259fb22b6fd6fa075b48dd6eb67be9ab501f5599c5296')

package() {
  install -Dm755 "hive" "${pkgdir}/usr/bin/hive"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
