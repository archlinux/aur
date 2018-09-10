### Maintainer: Gabriel Retana <isseigx at protonmail dot ch>

pkgname=lxqt-less-theme-git
pkgver=latest
pkgrel=1
pkgdesc="A minimal LXQt theme based on adapta"
arch=('any')
url="https://gitlab.com/isseigx/lxqt-less-theme"
license=('GPL')
optdepends=('kvantum-theme-adapta: recommended kvantum style'
'adapta-gtk-theme: recommended GTK theme')
_theme='less'
_repo='lxqt-less-theme'
source=("git+https://gitlab.com/isseigx/lxqt-less-theme.git")
md5sums=('SKIP')

pkgver() {
  echo "$(git -C "${srcdir}/${_repo}" rev-list --count HEAD)"
}

package() {
  install -d "${pkgdir}"/usr/share/lxqt/themes/"${_theme}"
  cp -r "${srcdir}/${_repo}/${_theme}"/* "${pkgdir}"/usr/share/lxqt/themes/"${_theme}"/ --preserve=mode
}
