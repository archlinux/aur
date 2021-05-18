# Maintainer: Emil Lundberg <emil@emlun.se>

pkgname=sddm-theme-gracilis-git
pkgver=latest
pkgrel=3
pkgdesc="Gracilis Theme for SDDM by mikkeloscar"
arch=('any')
url="https://github.com/mikkeloscar/sddm-gracilis-theme"
license=('CCPL:cc-by-sa')
depends=('sddm')
makedepends=('git')
_theme_name='gracilis'
_repo_name='sddm-gracilis-theme'
source=("git+https://github.com/mikkeloscar/sddm-gracilis-theme.git")
md5sums=('SKIP')

pkgver() {
  echo "$(git -C "${srcdir}/${_repo_name}" rev-list --count HEAD).0.0"
}

package() {
  install -d "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}"
  cp -r "${srcdir}/${_repo_name}"/* "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}"/
  find "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}" -type d -exec chmod 555 {} \;
  find "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}" -type f -exec chmod 444 {} \;
}
