# Maintainer: Ariel Popper <a@arielp.com>
pkgname=vim-airline-git
pkgver=0.7.r60.gf45ecda
pkgrel=1
epoch=1
pkgdesc="A lean & mean statusline for vim that's light as air."
arch=(any)
url="https://github.com/bling/vim-airline"
license=('GPL')
groups=()
depends=('vim-runtime')
optdepends=('otf-powerline-symbols-git: Use the Powerline symbols')
makedepends=('git')
install=airline.install
md5sums=('SKIP')

_gitname=airline
_gitbranch=master
source=("${_gitname}::git+https://github.com/bling/vim-airline.git#branch=${_gitbranch}")

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"
  local vimfiles="${pkgdir}/usr/share/vim/vimfiles"

  mkdir -p "${vimfiles}"
  cp -r autoload doc plugin t "${vimfiles}"
}

# vim:set ts=2 sw=2 et:
