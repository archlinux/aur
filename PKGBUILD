pkgname=sddm-slice-git
pkgver=50.0.0
pkgrel=1
pkgdesc="Simple dark SDDM theme with many customization options."
arch=('any')
url="https://github.com/RadRussianRus/sddm-slice"
license=('CCPL:cc-by-sa')
depends=('sddm' 'qt5-graphicaleffects')
makedepends=('git')
provides=("sddm-slice")
conflicts=("sddm-slice")
_theme_name='slice'
_repo_name='sddm-slice'
source=("git+https://github.com/RadRussianRus/${_repo_name}.git#branch=master")
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
