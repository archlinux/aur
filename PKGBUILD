# Maintainer: Kabir Kwatra <kabir@kwatra.me>

pkgname=dracula-grub-theme-git
_theme=dracula
pkgver=r5.9eb82b9
pkgrel=1
pkgdesc="Dark theme for GRUB Bootloader"
url='https://github.com/dracula/grub'
arch=('any')
license=('MIT')
depends=('grub')
makedepends=('git')
install=${pkgname}.install
source=("${pkgname}"::"git+https://github.com/dracula/grub")
md5sums=('SKIP')
pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  install -dm 755 "${pkgdir}/usr/share/grub/themes/dracula"
  cp -rf --no-preserve=ownership "${pkgname}/dracula" "${pkgdir}/usr/share/grub/themes/"
  install -Dm 644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
