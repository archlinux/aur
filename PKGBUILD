# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rrelayer-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="EVM transaction relayer"
arch=('x86_64')
url="https://github.com/joshstevens19/rrelayer"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/joshstevens19/rrelayer/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rrelayer_linux-amd64.tar.gz")
sha256sums=('98dc92429ffedf9e87551799bb6a0b0d3ee08ae2702f84279aaedce29d59710a')
sha256sums_x86_64=('ce538451e1af2c6ba93014fe2393e972671e879bd19b0089ec8372c29f72fc29')

package() {
  install -Dm755 "./rrelayer_cli" "${pkgdir}/usr/bin/rrelayer_cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
