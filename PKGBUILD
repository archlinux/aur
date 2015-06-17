# Maintainer: Oliver Baumann <baumanno at cip dot ifi dot lmu dot de>
pkgname=emmet-vim-git
pkgver=r817.920904c
pkgrel=1
pkgdesc="A vim plug-in which expands abbreviations, similar to emmet."
arch=(any)
url="https://github.com/mattn/emmet-vim"
license=('BSD')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=('emmet-vim')
install=emmet.install
sha256sums=('SKIP')

source=("$pkgname::git+https://github.com/mattn/emmet-vim#branch=master")

pkver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/$pkgname"
  local vimfiles="${pkgdir}/usr/share/vim/vimfiles"

  mkdir -p "${vimfiles}"
  cp -r autoload doc plugin "${vimfiles}"
}

# vim:set ts=2 sw=2 et:
