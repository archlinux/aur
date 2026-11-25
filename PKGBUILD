# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=adguardhome-sync-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Synchronize AdGuard Home config to replicas"
arch=('x86_64' 'aarch64')
url="https://github.com/bakito/adguardhome-sync"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/adguardhome-sync_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/adguardhome-sync_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fe04b23deef2b11514edc49f0e030c1f9ad08264229d82f4243651679698bb96')
sha256sums_aarch64=('9a4459bc2925cd47874a6ed3f0282dbb0b4ed71c3a45d6b5bc12108ce85f3f84')

package() {
  install -Dm755 "adguardhome-sync" "${pkgdir}/usr/bin/adguardhome-sync"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
