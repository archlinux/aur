# Maintainer: lmartinez-mirror
pkgname=vim-ayu-git
pkgver=r25.0745635
pkgrel=3
pkgdesc="Ayu colorscheme for vim"
arch=('any')
url="https://github.com/ayu-theme/ayu-vim"
license=('Apache')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find autoload colors term \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
