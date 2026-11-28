# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=colab-playground-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Desktop app for the Google Colab CLI with GPU sessions, cost guards and port forwarding"
arch=('x86_64')
url="https://github.com/scarletkc/colab-playground"
license=('MIT')
depends=('glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/colab-playground-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0137b2ea2214bee62acb55b3cf33693463235f912972b59ed126380d02bdb844')

package() {
  install -Dm755 "colab-playground-x86_64-unknown-linux-gnu/colab-playground" "${pkgdir}/usr/bin/colab-playground"
  install -Dm644 "colab-playground-x86_64-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "colab-playground-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
