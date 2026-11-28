# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=seq-db-bin
pkgver=0.83.0
pkgrel=1
pkgdesc="Scalable, high-performance log storage and query database"
arch=('x86_64' 'aarch64')
url="https://github.com/ozontech/seq-db"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/seq-db_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/seq-db_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ee8c08e093676f96b04e10e301ec81e40c612c7e8f2fc2180dd10a84c5332a9e')
sha256sums_aarch64=('2e760eb1a8c6a46d2ce9ccc98f1e667df74b733fd93607ac73c82a76aa144c93')

package() {
  install -Dm755 "seq-db" "${pkgdir}/usr/bin/seq-db"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
