### Maintainer: Gabriel Ibáñez <isseigx at protonmail dot ch>
_theme='simplicity'
_repo='simplicity-sddm-theme'

pkgname=simplicity-sddm-theme-git
pkgver=r80
pkgrel=1
pkgdesc="Simple SDDM Theme"
arch=('any')
url="https://gitlab.com/isseigx/simplicity-sddm-theme"
license=('GPL')

depends=('sddm' 'qt5-quickcontrols2')
makedepends=('git')
provides=("${_repo}")
conflicts=("${_repo}")

source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_repo"
    printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
  install -d "${pkgdir}"/usr/share/sddm/themes/"${_theme}"
  cp -r "${srcdir}/${_repo}/${_theme}"/* "${pkgdir}"/usr/share/sddm/themes/"${_theme}"/ --preserve=mode
}
