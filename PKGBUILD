# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgbase=vim-srcery-git
pkgname=('vim-srcery-git'
         'vim-airline-srcery-git'
         'vim-lightline-srcery-git'
         'vim-clap-srcery-git')
pkgver=0.10.0.r112.g9c692e3
pkgrel=1
pkgdesc="Dark colorscheme with contrasting colors and a slightly earthy tone"
arch=('any')
url="https://github.com/srcery-colors/srcery-vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgbase::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package_vim-srcery-git()  {
  optdepends=('vim-airline-srcery: Airline theme'
              'vim-lightline-srcery: Lightline theme'
              'vim-clap-srcery: Clap theme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/srcery/helper.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/srcery/"
  find colors doc \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-airline-srcery-git()  {
  depends=('vim-airline')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/airline/themes/srcery.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-lightline-srcery-git()  {
  depends=('vim-lightline-git')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/lightline/colorscheme/srcery.vim -t "$pkgdir/usr/share/vim/vimfiles/lightline/colorscheme/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-clap-srcery-git() {
  depends=('vim-clap')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/clap/themes/srcery.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/clap/themes/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
