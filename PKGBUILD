# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flowscope-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Privacy-first SQL lineage engine"
arch=('x86_64' 'aarch64')
url="https://github.com/pondpilot/flowscope"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/flowscope-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/flowscope-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6238670ca6786aa042a8a9c8428a7004632555a5b5f61f7a0f5973bab04a9382')
sha256sums_aarch64=('8542faf81081300ff37fc54bbc842c4dea64a070221ef082562c2a1bca57ae9a')

package() {
  install -Dm755 "flowscope" "${pkgdir}/usr/bin/flowscope"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
