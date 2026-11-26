# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=graymatter-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Persistent memory for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/angelnicolasc/graymatter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/graymatter_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/graymatter_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('387128420708ecff1d34def4b53851cbe60114e3f7bae574103952d8fe1b87d8')
sha256sums_aarch64=('2dbe267c2a9f29d867ca8e057e8ae042a5b89a359edecedd9268299bfd0dce68')

package() {
  install -Dm755 "graymatter" "${pkgdir}/usr/bin/graymatter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
