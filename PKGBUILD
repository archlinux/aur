# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=boot-to-talos-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Convert any OS to Talos Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/cozystack/boot-to-talos"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/boot-to-talos-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/boot-to-talos-linux-arm64.tar.gz")
sha256sums_x86_64=('46946b1c0862f2f1de0e01cb5be16002734a090f831b7a2d7b6efba7a895738b')
sha256sums_aarch64=('79f518550e996130cf0d042b3f7397d9ce8e3671611a67f621aa5a4b018e506b')

package() {
  install -Dm755 "boot-to-talos" "${pkgdir}/usr/bin/boot-to-talos"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
