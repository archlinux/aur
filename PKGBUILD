# Maintainer: lmartinez-mirror
pkgname=vim-which-key-git
pkgver=r103.2844350
pkgrel=1
pkgdesc="Vim plugin that shows keybindings in popup"
arch=('any')
url="https://github.com/liuchengxu/vim-which-key"
license=('unknown')
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
  find autoload doc ftplugin plugin syntax \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
