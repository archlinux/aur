# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=endstate-bin
pkgver=2.32.1
pkgrel=1
pkgdesc="Reinstall apps and restore settings on a fresh machine from one file"
arch=('x86_64' 'aarch64')
url="https://github.com/Artexis10/endstate"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Artexis10/endstate/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/endstate-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/endstate-linux-arm64")
sha256sums=('58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
sha256sums_x86_64=('b8c90fae7fa8b2447874be77634eafb5a9894d05d37fd039f087691ee9d722c6')
sha256sums_aarch64=('56556ac20327d1cfbfc714289a6c8d12e8cb9d452455a2685c8c32047b83b9f1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/endstate"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
