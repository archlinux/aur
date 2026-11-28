# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mihoro-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Mihomo command-line client for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/spencerwooo/mihoro"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/spencerwooo/mihoro/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mihoro-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mihoro-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('8f1b3eb04872ec2dc84d626283b91d0da29d2341017948680428803a7818c922')
sha256sums_x86_64=('7cb55db40ff2faad583593f1c527f5d292656ee0915fe3bcff1001c5972b434a')
sha256sums_aarch64=('8aa977e6da619719ecacab60295b835c19a3975c1e4562e2d8f6813b79f4861d')

package() {
  install -Dm755 "mihoro" "${pkgdir}/usr/bin/mihoro"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
