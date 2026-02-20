# Maintainer: Shiina Rikka <rikka@rikka.im>

pkgname=prts-plymouth
pkgver=1.0.0
pkgrel=1
pkgdesc="Rhodes Island PRTS loading slash animation"
arch=('x86_64')
url="https://github.com/LS-KR/prts-plymouth"
license=('CC-BY-4.0')
depends=('plymouth')
sha256sums=('SKIP' 'cbbcffd1d0ff4de61cbb093bc6ea443f39a5b5f0b7465ebb877c81aa4576523b')
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git" "${install}")

prepare() {
  mkdir "${pkgdir}/usr/share/plymouth/themes/prts" -p
}

package() {
  install -Dm755 "${pkgname}/animated-boot.script" "${pkgdir}/usr/share/plymouth/themes/prts/animated-boot.script"
  install -Dm755 "${pkgname}/prts.plymouth" "${pkgdir}/usr/share/plymouth/themes/prts/prts.plymouth"
  install -Dm755 -d "${pkgname}/img" "${pkgdir}/usr/share/plymouth/themes/prts/img"
}