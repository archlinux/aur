# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=litefs-bin
pkgver=0.5.14
pkgrel=1
pkgdesc="FUSE-based file system for replicating SQLite databases across a cluster of machines"
arch=('x86_64' 'aarch64')
url="https://github.com/superfly/litefs"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/superfly/litefs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/litefs-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/litefs-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('231190010850c57ab43e278a0b521e50a9fc63a7c571d683dd7febd4ab2cdf30')
sha256sums_aarch64=('c783d1b32ede08e03fbdb8c638861c6496f9401df7d8102aac7cac4c61d6a0ec')

package() {
  install -Dm755 "litefs" "${pkgdir}/usr/bin/litefs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
