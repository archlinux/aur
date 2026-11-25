# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cloudfox-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="Automating situational awareness for cloud penetration tests"
arch=('x86_64' 'aarch64')
url="https://github.com/BishopFox/cloudfox"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/BishopFox/cloudfox/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/cloudfox-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/cloudfox-linux-arm64.zip")
sha256sums=('186a8f88fbc2a785c8d1640d206c05e3b9bf2ca87e893bc8873ee12dbe659a42')
sha256sums_x86_64=('3cdc5a1a94ff14eb8df04d3dc8f9eca7db232a1315ceb8a7de26e4cb13e32fd5')
sha256sums_aarch64=('fcebd90329a8bb2f61c00cfb131572a44483251da532f1363a0ceb56541cd4ca')

package() {
  install -Dm755 "cloudfox/cloudfox" "${pkgdir}/usr/bin/cloudfox"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
