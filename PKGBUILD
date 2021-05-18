# Maintainer: Emil Lundberg <emil@emlun.se>

pkgname=sddm-theme-deepin-git
pkgver=latest
pkgrel=2
pkgdesc="Deepin Theme for SDDM by Match-Yang"
arch=('any')
url="https://github.com/Match-Yang/sddm-deepin"
license=('CCPL:cc-by-sa')
depends=('sddm' 'qt5-graphicaleffects')
makedepends=('git')
_theme_name='deepin'
_repo_name='sddm-deepin'
source=("git+https://github.com/Match-Yang/${_repo_name}.git#branch=master")
md5sums=('SKIP')

pkgver() {
  echo "$(git -C "${srcdir}/${_repo_name}" rev-list --count HEAD).0.0"
}

package() {
  install -d "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}"
  cp -r "${srcdir}/${_repo_name}/${_theme_name}"/* "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}"/
  find "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}" -type d -exec chmod 555 {} \;
  find "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}" -type f -exec chmod 444 {} \;
}
