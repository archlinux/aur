# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=vim-dein-git
_gitname=dein.vim
pkgver=0.0.r329.g9aac0c5
pkgrel=1
pkgdesc="dark powered Vim/Neovim plugin manager"
arch=('any')
url="https://github.com/Shougo/dein.vim"
license=('MIT')
depends=()
optdepends=(
  'neovim:  use in nvim'
  'vim>=7.4: use in vim'
)
makedepends=('git')
install=vim-dein-git.install
source=("git+https://github.com/Shougo/dein.vim")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_gitname}"

  vimpath="${pkgdir}/usr/share/vim/vimfiles"

  mkdir -p ${vimpath}/doc
  cp -R doc ${vimpath}
  mkdir -p ${vimpath}/autoload
  cp -R autoload ${vimpath}

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm 644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
}

