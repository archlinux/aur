# Maintainer: ml <ml@visu.li>
pkgname=vim-mustache-handlebars-git
pkgver=r145.697fa02
pkgrel=1
pkgdesc="Vim plugin for mustache and handlebars"
arch=('any')
url='https://github.com/mustache/vim-mustache-handlebars'
license=('unknown')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm644 example.mustache README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  cp -rt "$pkgdir/usr/share/vim/vimfiles" indent ftdetect ftplugin syntax
}
