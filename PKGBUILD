# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lan-sheriff-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Watch which servers your network talks to"
arch=('x86_64' 'aarch64')
url="https://github.com/291-Group/LAN-Sheriff"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lan-sheriff_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lan-sheriff_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('64ef939718babfb8483006bf555d4e0b5c26932b325b5450a59c63982b225bad')
sha256sums_aarch64=('b18f6aa1f9e82656fc46a70d0e46403745de924768270c9cce2b45280a2bc505')

package() {
  install -Dm755 "./lan-sheriff" "${pkgdir}/usr/bin/lan-sheriff"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
