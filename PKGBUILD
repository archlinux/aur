# Maintainer: lmartinez-mirror
pkgbase=vim-nightfly-git
pkgname=('vim-nightfly-git' 'vim-airline-nightfly-git' 'vim-lightline-nightfly-git')
pkgver=r118.8f96830
pkgrel=1
pkgdesc="A dark GUI colorscheme inspired by Night Owl"
arch=('any')
url="https://github.com/bluz71/vim-nightfly-guicolors"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgbase::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-nightfly-git() {
  optdepends=('vim-airline-nightfly' 'vim-lightline-nightfly')

  cd "$pkgbase"
  install -Dm 644 colors/nightfly.vim "$pkgdir/usr/share/vim/vimfiles/colors/nightfly.vim"
}

package_vim-airline-nightfly-git() {
  depends=('vim-airline')
  optdepends=('vim-nightfly')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dm 644 autoload/airline/themes/nightfly.vim "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/nightfly.vim"
}

package_vim-lightline-nightfly-git() {
  depends=('vim-lightline')
  optdepends=('vim-nightfly')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dm 644 autoload/lightline/colorscheme/nightfly.vim "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/nightfly.vim"
}