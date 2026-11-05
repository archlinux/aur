# Maintainer: agony <27015 at riseup dot net>

pkgname=lakekeeper-bin
pkgver=0.14.2
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
sha256sums_x86_64=('e1eb2de75f95c1124f91ed32bfd14bcbddf906f91651bbd446ad9a0af99251b8')
sha256sums_aarch64=('501b946d53189ea75c8921f4d6b03501214ee830ec45a9fe25e32c826d1c6889')

package() {
  install -Dm755 lakekeeper -t "${pkgdir}/usr/bin"
  install -Dm644 "lakekeeper-${pkgver}-NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
