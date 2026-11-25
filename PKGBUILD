# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=omniinfer-bin
pkgver=0.3.31
pkgrel=1
pkgdesc="Unified inference runtime for edge AI"
arch=('x86_64')
url="https://github.com/omnimind-ai/OmniInfer"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/omniinfer-v${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('32f5af406f7065cf7b9b3d2c54b96de63622b7a75acb7c0999cfa44dfa3f6561')

package() {
  install -Dm755 "OmniInfer/omniinfer" "${pkgdir}/usr/bin/omniinfer"
  install -Dm644 "OmniInfer/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "OmniInfer/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
