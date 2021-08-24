# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=vim-rhubarb-git
_name="${pkgname%-git}"

pkgver() {
  cd "$_name"
  printf r%s.%s "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r89.e4f7fb8
pkgrel=1

pkgdesc='Github extension for vim-fugitive'
arch=('any')
url="https://github.com/tpope/$_name"
license=('MIT')

groups=('vim-plugins')

makedepends=('git')
depends=('vim' 'vim-fugitive')
optdepends=('hub: used instead of git if installed')

provides=("$_name")
conflicts=("$_name")

install=vimdoc.install
source=("git+$url.git")
sha256sums=('SKIP')


package() {
  cd "$_name"
  install -Dm644 "plugin/${_name#vim-}.vim"   -t"$pkgdir/usr/share/vim/vimfiles/plugin/"
  install -Dm644 "autoload/${_name#vim-}.vim" -t"$pkgdir/usr/share/vim/vimfiles/autoload/"
  install -Dm644 "doc/${_name#vim-}.txt"      -t"$pkgdir/usr/share/vim/vimfiles/doc/"
  install -Dm644 README.markdown              -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE                      -t"$pkgdir/usr/share/licenses/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
