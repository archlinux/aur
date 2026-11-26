# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=boss-bin
pkgver=3.0.17
pkgrel=1
pkgdesc="Dependency manager for Delphi and Lazarus"
arch=('x86_64' 'aarch64')
url="https://github.com/HashLoad/boss"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/boss_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/boss_Linux_arm64.tar.gz")
sha256sums_x86_64=('c40ec124f4f2563b6c873dbeeba2dfad6b80b644a0f765a7291bd9efd0b21e3e')
sha256sums_aarch64=('45eaf0ff2f1c7a9a276815148eea562471a3a2aafe64103b6a57476482035539')

package() {
  install -Dm755 "boss" "${pkgdir}/usr/bin/boss"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
