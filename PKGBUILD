# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=objinsync-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Continuously sync directories from an object store to the local filesystem"
arch=('x86_64' 'aarch64')
url="https://github.com/scribd/objinsync"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/objinsync_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/objinsync_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('92a835121bd27cd6dd0772b9045e12dc0b0f774f0bb5db5ec8d12d5b099c9c3e')
sha256sums_aarch64=('bef39883a338d055f0cc9294e0558e190c3cca55ad952652c86752bb2649263d')

package() {
  install -Dm755 "objinsync" "${pkgdir}/usr/bin/objinsync"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
