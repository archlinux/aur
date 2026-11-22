# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=snipt-tui-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A text snippet expansion tool with a TUI for managing snippets"
arch=('x86_64')
url="https://github.com/snipt/snipt"
license=('MIT')
depends=('glibc' 'libgcc' 'libx11' 'libxtst' 'xdotool')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/snipt/snipt/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/snipt-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('f1fc2b85ff2be37f681afce68fc721f8e1897f7a7379b27e8ec16a2d4f4ccf7c')
sha256sums_x86_64=('5e23a17f23a0767081b78dba03183a93ef2fa03939efa8ba5b728dbae207007e')

package() {
  install -Dm755 "snipt" "${pkgdir}/usr/bin/snipt"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
