# Maintainer: Rafael silva <perigoso@riseup.net>

themename="catppuccin"
pkgname=sddm-theme-${themename}-git
pkgver=r40.da92da8
pkgrel=1
pkgdesc="Soothing pastel theme for SDDM"
arch=('any')
url="https://github.com/catppuccin/sddm"
license=('MIT')
depends=('sddm')
makedepends=('git')
source=("${themename}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${themename}"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/sddm/themes/"

  cp -dr --no-preserve=ownership "${themename}" "${pkgdir}/usr/share/sddm/themes/${themename}"

  rm -rf "${pkgdir}/usr/share/sddm/themes/${themename}/README.md"
}
