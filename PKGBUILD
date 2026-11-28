# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=thunderdome-planning-poker-bin
pkgver=5.19.0
pkgrel=1
pkgdesc="Agile planning poker, sprint retro and story mapping tool"
arch=('x86_64' 'aarch64')
url="https://github.com/StevenWeathers/thunderdome-planning-poker"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/thunderdome-planning-poker_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/thunderdome-planning-poker_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('90280534bc1a9c333be38e2ab52a5776cc1c60158257fa32a0d84b9977413f4b')
sha256sums_aarch64=('e55549cf97d2ffa646bfe048f87342f4978975ef1bbd566b5b6098e4cf0841f2')

package() {
  install -Dm755 "thunderdome-planning-poker" "${pkgdir}/usr/bin/thunderdome-planning-poker"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
