# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tigrisfs-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="High performance FUSE filesystem for AI workloads with S3 compatible backends"
arch=('x86_64' 'aarch64')
url="https://github.com/tigrisdata/tigrisfs"
license=('Apache-2.0')
depends=('fuse3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tigrisfs_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tigrisfs_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('94e5e73df98186c87aec9e8bb1338fdbc92915f00f98cd3508f8f2f40764159a')
sha256sums_aarch64=('14c07933aa7fa6916c9ee2eff7dcbce03208c90b524df868e8a16ecfd6ad61b8')

package() {
  install -Dm755 "tigrisfs" "${pkgdir}/usr/bin/tigrisfs"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.geesefs" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
