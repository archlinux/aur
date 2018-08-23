# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=vim-dein
pkgver=2.0
pkgrel=1
pkgdesc="dark powered Vim/Neovim plugin manager"
arch=('any')
url="https://github.com/Shougo/dein.vim"
license=('MIT')
depends=()
optdepends=(
  'neovim: use in nvim'
  'vim: use in vim'
)
makedepends=('git')
conflicts=('vim-dein-git')
install=vim-dein.install
source=("https://github.com/Shougo/dein.vim/archive/${pkgver}.tar.gz")
sha512sums=('7029a4285e83fecf26cbd25cc167b270175b2cef24202185965bcf734f867c5c6e713f22f4826133eea3dfa27abc4eb98b15afab828b1ce6414390a8e0f7aee5')

package() {
  cd "dein.vim-${pkgver}"
  sharepath="${pkgdir}/usr/share"
  vimpath="${sharepath}/vim/vimfiles"
  # install to global Vim directory
  install -Dm 644 doc/dein.txt "${vimpath}/doc/dein.txt"
  cp -R autoload ${vimpath}
  # LICENSE and README
  install -Dm 644 LICENSE ${sharepath}/licenses/${pkgname}/LICENSE
  install -Dm 644 README.md ${sharepath}/doc/${pkgname}/README
}
