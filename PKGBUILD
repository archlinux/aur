# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ai-distiller-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Extract essential public APIs, types and structure from large codebases for AI"
arch=('x86_64' 'aarch64')
url="https://github.com/janreges/ai-distiller"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/janreges/ai-distiller/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/aid-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/aid-linux-arm64-v${pkgver}.tar.gz")
sha256sums=('9ed20aece3cd03984e231cd26b4d0dc0847f34507f148e668eac0fd29a2ab9c9')
sha256sums_x86_64=('e72b8c89545513389b8c97ab34c77fdfb006cbd701e7e4ba5bc397ed1bcb0908')
sha256sums_aarch64=('0a7c4fe536778b322aeadff04d4719d8baf6fa24aad56a058e1814d3ecc36c41')

package() {
  install -Dm755 "aid" "${pkgdir}/usr/bin/aid"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
