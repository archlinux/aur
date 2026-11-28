# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=spotinfo-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Explore spot instance pricing across AWS, GCP and Azure"
arch=('x86_64' 'aarch64')
url="https://github.com/alexei-led/spotinfo"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/alexei-led/spotinfo/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/spotinfo_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/spotinfo_linux_arm64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('27cf1348fac8528c36794c68c70cf130b1039c96bff76b9074e394ef61969b21')
sha256sums_aarch64=('302b936a320340864c8b885f17f025a086ad45e9bbcd930472df71e015dba6c6')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/spotinfo"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
