# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ai-rules-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Manage AI rules, commands and skills across coding agents from one place"
arch=('x86_64' 'aarch64')
url="https://github.com/block/ai-rules"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/block/ai-rules/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ai-rules-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ai-rules-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('bd54eb880333876cf6ae350fd0837b2d1641ad57b531b73033743601c5771d9a')
sha256sums_x86_64=('75dc728a9073933a23391a94da2ac1a46852f8dcfe5fc4570c2905e0392175a0')
sha256sums_aarch64=('7171cded0924d2885fcc3014a657485f1b4f82789db4f077281618bc778c63e3')

package() {
  install -Dm755 "ai-rules" "${pkgdir}/usr/bin/ai-rules"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
