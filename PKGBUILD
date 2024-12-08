# Maintainer: Mill Haruto <mill4134[at]outlook[dot]com>

pkgname=vim-floaterm-git
pkgver=r4e28c8d
pkgrel=1
pkgdesc='💻 Terminal manager for (neo)vim'
arch=('any')
url='https://github.com/voldikss/vim-floaterm'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git rev-parse --short HEAD | sed 's/^/r/'
}

package() {
  cd "$pkgname"
  find autoload bin doc lua plugin -type f \
    -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}