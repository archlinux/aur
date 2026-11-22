# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=invocra-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A terminal dashboard for GitLab CI across projects and servers, with per-project branch selection"
arch=('x86_64')
url="https://github.com/dsszs3333/invocra"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dsszs3333/invocra/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/invocra-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('066e03e8962b6c5b088bea744134186355f57bbf2b7d0f0e97dcafc2fd5ae755')
sha256sums_x86_64=('e9315d2b3497b6af9846fdf9a143a81ed3cc011bbd3e390b98dc91be298f78bc')

package() {
  install -Dm755 "invocra" "${pkgdir}/usr/bin/invocra"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
