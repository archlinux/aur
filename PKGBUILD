# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=niks3-bin
pkgver=1.19.0
pkgrel=1
pkgdesc="S3-backed Nix binary cache with garbage collection"
arch=('x86_64' 'aarch64')
url="https://github.com/Mic92/niks3"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/niks3_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/niks3_Linux_arm64.tar.gz")
sha256sums_x86_64=('5e13424d0f54d4bf26a69857539329bc8b3de14ab53ede967f527365fc64993b')
sha256sums_aarch64=('f06bd2bf4670c297cf22e0a44281f53b7b75325b64a5918a7159127c35d068c3')

package() {
  install -Dm755 "niks3" "${pkgdir}/usr/bin/niks3"
  install -Dm755 "niks3-server" "${pkgdir}/usr/bin/niks3-server"
  install -Dm755 "niks3-hook" "${pkgdir}/usr/bin/niks3-hook"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
