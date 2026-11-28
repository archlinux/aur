# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=immich-stack-bin
pkgver=0.2.44
pkgrel=1
pkgdesc="Group similar Immich photos into stacks"
arch=('x86_64' 'aarch64')
url="https://github.com/Majorfi/immich-stack"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/immich-stack_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/immich-stack_Linux_arm64.tar.gz")
sha256sums_x86_64=('4016fcd5f147b96a62c91aa94ef4a1daad95f838c59fd58c6c04fa4ff716f43b')
sha256sums_aarch64=('c33afda26a3b640eb31b17a94d0df1741b55277e0b1ec390e27cd3f5470d859f')

package() {
  install -Dm755 "immich-stack" "${pkgdir}/usr/bin/immich-stack"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
