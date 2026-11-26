# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=frontier-bin
pkgver=0.122.1
pkgrel=1
pkgdesc="User management platform for identity, access and billing"
arch=('x86_64' 'aarch64')
url="https://github.com/raystack/frontier"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/frontier_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/frontier_Linux_arm64.tar.gz")
sha256sums_x86_64=('4a5b38143116757e50b3a20d1ba499d04760db3fceb5bb5da3bdae392e142e26')
sha256sums_aarch64=('b1cb761604912926f996af0aa6d5954ec733acc9e1b7c10e0c1fcf8613735afe')

package() {
  install -Dm755 "frontier" "${pkgdir}/usr/bin/frontier"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
