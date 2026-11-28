# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=memmesh-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Persistent, self-improving memory for AI agents"
arch=('x86_64')
url="https://github.com/ThinkfleetAI/memmesh"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ThinkfleetAI/memmesh/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/memmesh-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a4eff55dff4afaa18c172525c339ae67aff2b38fc9ee16c0a5308245d684da70')
sha256sums_x86_64=('c7d830e58e73bdfa8008d078b787e5162a713fca169dda2e31331fb257539a48')

package() {
  install -Dm755 "memmesh" "${pkgdir}/usr/bin/memmesh"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
