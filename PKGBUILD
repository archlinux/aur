# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sherlock-rs-bin
pkgver=5.0.8
pkgrel=1
pkgdesc="Find social media accounts by username"
arch=('x86_64' 'aarch64')
url="https://github.com/jonaylor89/sherlock-rs"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'sherlock' 'sherlock-git')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sherlock-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sherlock-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9bce05e50a9e665e191cbdd4ee4f5ac71086ea4f56fa2c8d0d5747382bbfb9e7')
sha256sums_aarch64=('b88878864319725dada1ac742d940010c4677e9930e8bca502f34de3d074db6a')

package() {
  install -Dm755 "sherlock" "${pkgdir}/usr/bin/sherlock"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
