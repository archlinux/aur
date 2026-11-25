# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=packsquash-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Minecraft Java Edition resource and data pack optimizer"
arch=('x86_64' 'aarch64')
url="https://github.com/ComunidadAylas/PackSquash"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ComunidadAylas/PackSquash/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/packsquash-x86_64-unknown-linux-gnu.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/packsquash-aarch64-unknown-linux-gnu.zip")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('56c1997b0a223b93238488708e52cee5de6e1f29e500ae49875ea31f6936acfb')
sha256sums_aarch64=('04e4569531390d9da1ac9fc21c913aed5e5deebc396e07236d357a26a3e78e36')

package() {
  install -Dm755 "packsquash" "${pkgdir}/usr/bin/packsquash"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
