# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=valin-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="Cross-platform code editor built with Freya"
arch=('x86_64')
url="https://github.com/marc2332/valin"
license=('MIT')
depends=('fontconfig' 'freetype2' 'glibc' 'libgcc' 'libglvnd' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/marc2332/valin/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/valin-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7537ed22b2bb1bb6843631e2787b8516b7817440318ef400fd4d832c68371963')
sha256sums_x86_64=('6a8c6289908602dc532c5e655de49d9657b7cfba4e7a64f8eb05a9285524d9ef')

package() {
  install -Dm755 "valin" "${pkgdir}/usr/bin/valin"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
