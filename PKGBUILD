# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=actions-sync-bin
pkgver=202610071604
pkgrel=1
pkgdesc="Sync GitHub Actions to GitHub Enterprise Server instances"
arch=('x86_64' 'aarch64')
url="https://github.com/actions/actions-sync"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/actions.actions-sync_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/actions.actions-sync_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a038b7fb4f743255995a3a5709ffb97174ddf3bc4914d4f379b038eaf557b2ab')
sha256sums_aarch64=('c9609040dc3731813a89dc39122bbfad079cfe87b52c5441e14d6bab77c525b2')

package() {
  install -Dm755 "bin/actions-sync" "${pkgdir}/usr/bin/actions-sync"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
