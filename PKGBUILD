# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=conflux-rust-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Rust implementation of the Conflux blockchain protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/Conflux-Chain/conflux-rust"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Conflux-Chain/conflux-rust/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/conflux-v${pkgver}-linux-x86_64-glibc2.27.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/conflux-v${pkgver}-linux-aarch64-glibc2.27.tar.gz")
sha256sums=('928137f2380ba70c58a144bae385a66397c9fcf4a21db60825b908a99720ed0a')
sha256sums_x86_64=('7971eb8b6799bc393fbccf57c6dd7aad82b2b8a21c874d3aeafafa02710cfe68')
sha256sums_aarch64=('1de7cd77b119d0fedcff4e7271253aeecaf9d4d188894816e6efdd537c0c68b3')

package() {
  install -Dm755 "./conflux" "${pkgdir}/usr/bin/conflux"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
