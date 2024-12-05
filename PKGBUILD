# Maintainer: Max Gautier <mg@max.gautier.name>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=vim-jsonnet-git
_pkgname=vim-jsonnet
pkgver=0.33.4ebc661
pkgrel=3
pkgdesc='Jsonnet filetype plugin for Vim.'
arch=('any')
url="https://github.com/google/vim-jsonnet"
license=('Apache-2.0')
makedepends=('git')
depends=('vim')
groups=('vim-plugins')
source=("git+https://github.com/google/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}

  # Install vimfiles
  local vimfiles="$pkgdir/usr/share/vim/vimfiles"
  mkdir -p "$vimfiles"
  cp -r --no-preserve=ownership -t "$vimfiles" autoload/ doc/ ftdetect/ ftplugin/ plugin/ syntax/ syntax_checkers/
}
