# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hntui-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Hacker News reader for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ahmd-sh/hntui"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ahmd-sh/hntui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/hntui-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/hntui-linux-arm64.tar.gz")
sha256sums=('567f2da3223d7b13f328b8b33b1106f477750ba9e6259ed80d35e376d03e9bc9')
sha256sums_x86_64=('3d996e08e3e34b7de437e518828c4b0aae9222bc70104c82e83535a9a4812b1e')
sha256sums_aarch64=('e35f3a8a949371bfd593ebdd97443503b882de3c7284a7dcec031c55bba52c6d')

package() {
  install -Dm755 "hntui" "${pkgdir}/usr/bin/hntui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
