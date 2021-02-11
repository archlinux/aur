# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=vim-smoothie-git

pkgver() { git -C "${pkgname%-git}" log -n1 --format=%cs.g%h | tr - .; }
pkgver=2021.02.07.g10fd0aa
pkgrel=1

pkgdesc='Smoth scrolling for Vim done right'
groups=('vim-plugins')
arch=('any')
url="https://github.com/psliwka/${pkgname%-git}"
license=('MIT')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

makedepends=('git')
depends=('vim')

source=("git+$url.git")
sha256sums=('SKIP')


package() {
  cd "${pkgname%-git}"
  install -Dm644 plugin/smoothie.vim -t"$pkgdir/usr/share/vim/vimfiles/plugin/"
  install -Dm644 autoload/smoothie.vim -t"$pkgdir/usr/share/vim/vimfiles/autoload/"
  install -Dm644 README.md demo.gif -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/${pkgname%-git}/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
