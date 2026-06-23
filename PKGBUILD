# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=vim-dein
pkgver=3.1
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
sha512sums=('89dddbbc27b11731116583d251ae5dd6c917efcfc051347ab0e3dd93b488db11e5d7f741db7cba54428da7b9c0b69e2600173f06d8e1468600f1fdc5d26361f0')

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
