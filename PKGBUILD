# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgbase=vim-colors-pencil-git
pkgname=('vim-colors-pencil-git' 'vim-airline-pencil-git')
pkgver=1.0.r13.gfcbdca1
pkgrel=1
pkgdesc="Light & dark colorscheme inspired by iA Writer"
arch=('any')
url="https://github.com/preservim/vim-colors-pencil"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
source=("$pkgbase::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package_vim-colors-pencil-git()  {
  depends=('vim-plugin-runtime')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 colors/pencil.vim "$pkgdir/usr/share/vim/vimfiles/colors/pencil.vim"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_vim-airline-pencil-git()  {
  depends=('vim-airline' 'vim-plugin-runtime')
  optdepends=('vim-colors-pencil: Base vim colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/airline/themes/pencil.vim "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/pencil.vim"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}