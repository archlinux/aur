# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=yoyo-evolve-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A coding agent that evolves its own source, in public 200 lines of Rust on day one, every commit since agent-written and tests-gated"
arch=('x86_64')
url="https://github.com/yologdev/yoyo-evolve"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/yologdev/yoyo-evolve/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/yoyo-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('3c5eb0f910afe903dbba909331ae756aaa76517da3df8609786ef660c994afe1')
sha256sums_x86_64=('f8cb71135e6ad065cb3d62e19c71b966cac42ba5d2a09ee8980bacc1e8699b92')

package() {
  install -Dm755 "yoyo" "${pkgdir}/usr/bin/yoyo"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
