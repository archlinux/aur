# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ai-observer-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Unified local observability for AI agents"
arch=('x86_64')
url="https://github.com/tobilg/ai-observer"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tobilg/ai-observer/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ai-observer-linux-amd64-v${pkgver}.tar.gz")
sha256sums=('554fa0be07c308cba3cdb261365c63a68d82f2153e52d292923c7699f3c4cbdf')
sha256sums_x86_64=('bcb2aa8bf5d172cb8d67fa90075d40380be80ffe1185773012b89f72690e5fe3')

package() {
  install -Dm755 "ai-observer" "${pkgdir}/usr/bin/ai-observer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
