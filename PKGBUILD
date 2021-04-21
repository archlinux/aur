# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgbase=vim-tender-git
pkgname=('vim-tender-git'
         'vim-airline-tender-git'
         'vim-lightline-tender-git')
pkgver=r131.25924cb
pkgrel=1
pkgdesc="A 24-bit colorscheme for vim, airline, and lightline"
arch=('any')
url="https://github.com/jacoborus/tender.vim"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
source=("$pkgbase::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-tender-git()  {
  depends=('vim-plugin-runtime')
  optdepends=('vim-airline-tender'
              'vim-lightline-tender')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 colors/tender.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-airline-tender-git()  {
  depends=('vim-plugin-runtime' 'vim-airline')
  optdepends=('vim-tender')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/airline/themes/tender.vim -t "$pkgdir/usr/share/vim/vimfiles/airline/themes/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-lightline-tender-git()  {
  depends=('vim-plugin-runtime' 'vim-lightline-git')
  optdepends=('vim-tender')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/lightline/colorscheme/tender.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
