# Maintainer: agony <27015 at riseup dot net>

pkgname=lakekeeper-bin
pkgver=0.15.0
pkgrel=1
pkgdesc='Apache Iceberg REST catalog (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/lakekeeper/lakekeeper'
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("lakekeeper=${pkgver}")
conflicts=('lakekeeper')
install=lakekeeper.install
_release="${url}/releases/download/v${pkgver}"
source=("lakekeeper-${pkgver}-NOTICE::https://raw.githubusercontent.com/lakekeeper/lakekeeper/v${pkgver}/NOTICE")
source_x86_64=("lakekeeper-${pkgver}-x86_64.tar.gz::${_release}/lakekeeper-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("lakekeeper-${pkgver}-aarch64.tar.gz::${_release}/lakekeeper-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('13d28577ff9b20b8c7c31ce33c00168b83f84a87c06fa15a6c7ee17985a48a1b')
sha256sums_x86_64=('c7efe8c71dae5d0f68c1f56d7a2dc18638976ae1d05cbd54df0a97ba2e35d049')
sha256sums_aarch64=('7106969df7bfa7edc13bb71ef38c4a24c2747e2518e212578c06df34b040adc5')

package() {
  install -Dm755 lakekeeper -t "${pkgdir}/usr/bin"
  install -Dm644 "lakekeeper-${pkgver}-NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
