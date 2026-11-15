# Maintainer: agony <27015 at riseup dot net>

pkgname=lakekeeper-bin
pkgver=0.15.1
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
sha256sums_x86_64=('450da6b37afce87a6e40ee94467def0664b5e879f5a8a2296b43c5a3e1796c33')
sha256sums_aarch64=('75ae321291e114ef3a11bc5b67e3899c38051b648d6b26994477aa16b14a81e6')

package() {
  install -Dm755 lakekeeper -t "${pkgdir}/usr/bin"
  install -Dm644 "lakekeeper-${pkgver}-NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
