# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wallfacer-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Terminal session manager for Claude Code"
arch=('x86_64' 'aarch64')
url="https://github.com/pradipta/wallfacer"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wallfacer-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wallfacer-linux-arm64.tar.gz")
sha256sums_x86_64=('de93dc1a584a091a8ab560b812b55764b1aacf340cb7c4ec17be83e96a3a1ea9')
sha256sums_aarch64=('ebae08b01042a548c8e772e9c8c116546e59b9df2efd639da5b776514d35c344')

package() {
  install -Dm755 "wallfacer" "${pkgdir}/usr/bin/wallfacer"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
