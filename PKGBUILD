# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=maestro-runner-bin
pkgver=1.1.31
pkgrel=1
pkgdesc="Fast mobile UI test automation for Android, iOS, React Native, Flutter and Expo"
arch=('x86_64' 'aarch64')
url="https://github.com/devicelab-dev/maestro-runner"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/maestro-runner-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/maestro-runner-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('a5c19b6eeea0b520a82d58a77a2d6355e4373871bdf7c2489decdbdb2dd08b0e')
sha256sums_aarch64=('0d86e54210d20506b15f297c7327aeafcc7c10560b6ada135eceb100eaa58ae2')

package() {
  install -Dm755 "maestro-runner/bin/maestro-runner" "${pkgdir}/usr/bin/maestro-runner"
  install -Dm644 "maestro-runner/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "maestro-runner/drivers/LICENSE-BINARIES.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "maestro-runner/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
