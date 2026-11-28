# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bruin-bin
pkgver=0.11.840
pkgrel=1
pkgdesc="Build data pipelines with SQL and Python, ingest data from different sources, add quality checks, and build end-to-end flows"
arch=('x86_64' 'aarch64')
url="https://github.com/bruin-data/bruin"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bruin_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bruin_Linux_arm64.tar.gz")
sha256sums_x86_64=('be61f13ae705e709a1876a6ddaa4a49b68ebdedfe8d74bda227d8590c44d18e0')
sha256sums_aarch64=('c64477ac9e236055b673702e4d6522f05d7009ef239edd9dea6a0bef26d8c9df')

package() {
  install -Dm755 "bruin" "${pkgdir}/usr/bin/bruin"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
