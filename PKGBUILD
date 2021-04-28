# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-splitjoin-git
pkgver=1.0.0.r144.gf4773c0
pkgrel=1
pkgdesc="Vim plugin for switching between single-line and multi-line forms of code"
arch=('any')
url="https://github.com/andrewradev/splitjoin.vim"
license=('MIT')
groups=('vim-plugins')
depends=('ruby' 'vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc ftplugin plugin spec \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
