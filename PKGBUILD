# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=olaf-bin
pkgver=3.3.3
pkgrel=1
pkgdesc="Lightweight, portable acoustic fingerprinting system"
arch=('x86_64' 'aarch64')
url="https://github.com/JorenSix/Olaf"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/JorenSix/Olaf/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/olaf_cli-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/olaf_cli-linux-aarch64.tar.gz")
sha256sums=('d11d906d7e29af95d28b051cd89a064bb25ae27a5c407c9994626c47e13bdc8f')
sha256sums_x86_64=('a9c2c38aa9076cf3a7eeb3ecfeb51a493d54d1c6f740bb49aa0ae71166209946')
sha256sums_aarch64=('12f0355c5e28427c78332b0f1671782d1457b7ce9ebcc658d82d71d4823fa386')

package() {
  install -Dm755 "olaf" "${pkgdir}/usr/bin/olaf"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
