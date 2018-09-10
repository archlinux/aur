### Maintainer: Gabriel Retana <isseigx at protonmail dot ch>

pkgname=lxqt-arc-dark-theme-git
pkgver=latest
pkgrel=3
pkgdesc="A dark theme for LXQt based on Arc"
arch=('any')
url="https://gitlab.com/isseigx/lxqt-arc-dark-theme"
license=('GPL')
optdepends=('kvantum-theme-arc: recommended kvantum style'
'arc-gtk-theme: GTK theme')
_theme='arc-dark'
_repo='lxqt-arc-dark-theme'
source=("git+https://gitlab.com/isseigx/lxqt-arc-dark-theme.git")
md5sums=('SKIP')

pkgver() {
  echo "$(git -C "${srcdir}/${_repo}" rev-list --count HEAD)"
}

package() {
  install -d "${pkgdir}"/usr/share/lxqt/themes/"${_theme}"
  cp -r "${srcdir}/${_repo}/${_theme}"/* "${pkgdir}"/usr/share/lxqt/themes/"${_theme}"/ --preserve=mode
}
