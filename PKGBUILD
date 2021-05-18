# Maintainer: Emil Lundberg <emil@emlun.se>

pkgname=sddm-theme-abstractdark-git
pkgver=latest
pkgrel=3
pkgdesc="Abstract Dark theme for SDDM by 3ximus"
arch=('any')
url="https://github.com/3ximus/abstractdark-sddm-theme"
license=('CCPL:cc-by-sa')
depends=('sddm')
makedepends=('git')
_theme_name='abstractdark'
_repo_name='abstractdark-sddm-theme'
source=("git+https://github.com/3ximus/abstractdark-sddm-theme.git")
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
