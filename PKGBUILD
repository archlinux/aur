# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: reedts <j.reedts at gmail dot com>
pkgbase=vim-nord-git
pkgname=('vim-nord-git' 'vim-airline-nord-git' 'vim-lightline-nord-git')
pkgver=0.7.0.r94.gea7ff9c
pkgrel=2
pkgdesc="An arctic, north-bluish clean and elegant Vim theme."
arch=('any')
url="https://github.com/arcticicestudio/nord-vim"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
source=("$pkgbase::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package_vim-nord-git() {
  depends=('vim-plugin-runtime')
  optdepends=('vim-airline-nord: Airline theme'
              'vim-lightline-nord: Lightline theme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dm644 colors/nord.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_vim-airline-nord-git()  {
  depends=('vim-airline' 'vim-plugin-runtime')
  optdepends=("${pkgbase%-git}: Base vim theme")
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dm 644 autoload/airline/themes/nord.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_vim-lightline-nord-git()  {
  depends=('vim-lightline-git' 'vim-plugin-runtime')
  optdepends=("${pkgbase%-git}: Base vim theme")
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dm 644 autoload/lightline/colorscheme/nord.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
