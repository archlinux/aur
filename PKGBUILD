# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=timelinize-bin
pkgver=0.0.28
pkgrel=1
pkgdesc="Organize data from all your accounts and devices into one local timeline"
arch=('x86_64' 'aarch64')
url="https://github.com/timelinize/timelinize"
license=('AGPL-3.0-only')
depends=('glib2' 'glibc' 'libvips')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/timelinize/timelinize/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/timelinize_v${pkgver}_linux_x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/timelinize_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('3b57a3e25739b5d8623a0953dde984cd508e3c9a3171e027f0cb078438394d71')
sha256sums_aarch64=('69fe8a58d29320476cf3e5d765434996ff29f5beb3d8e2d30e28150b39a698bc')

package() {
  install -Dm755 "timelinize" "${pkgdir}/usr/bin/timelinize"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
