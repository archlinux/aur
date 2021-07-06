# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=vim-winresizer-git
_pkgname="${pkgname%-git}"
_name="${_pkgname#vim-}"

pkgver() { git -C "$_name" describe --tags | sed 's/^v//;s/-/.r/;s/-g/./'; }
pkgver=1.1.1.r23.9dc9899
pkgrel=1

pkgdesc='Easily resize your vim windows'
arch=('any')
url="https://github.com/simeji/$_name"
license=('MIT')

groups=('vim-plugins')

makedepends=('git')
depends=('vim')

provides=("$_pkgname")
conflicts=("$_pkgname")

install=vimdoc.install
source=("git+$url.git")
sha256sums=('SKIP')


package() {
  cd "$_name"
  install -Dm644 "plugin/${_name#vim-}.vim"   "$pkgdir/usr/share/vim/vimfiles/plugin/$_pkgname.vim"
  install -Dm644 "autoload/${_name#vim-}.vim" "$pkgdir/usr/share/vim/vimfiles/autoload/$_pkgname.vim"
  install -Dm644 "doc/${_name#vim-}.txt"      "$pkgdir/usr/share/vim/vimfiles/doc/$_pkgname.txt"
  install -Dm644 README.md                    -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE                      -t"$pkgdir/usr/share/licenses/$_name/"
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
