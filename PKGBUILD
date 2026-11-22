# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rustfm-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal file manager with a sidebar, multiple panels, live preview, and a task queue"
arch=('x86_64')
url="https://github.com/CanReader/rustfm"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rustfm-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('eafbd0ce70ff78389e78c4da3c6207606296e26e51981b816ecb3ad8c64b9978')

package() {
  cd "rustfm-v${pkgver}-linux-x86_64"
  install -Dm755 "rustfm" "${pkgdir}/usr/bin/rustfm"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
