# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-suda
pkgver=0.3.1
pkgrel=1
pkgdesc="Vim plugin for writing out files with sudo"
arch=('any')
url="https://github.com/lambdalisue/suda.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'sudo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('559e85ebc012aed4c3a4758e8ab8828fa468638fa95c8b798ce69c508f77cc1b')

package() {
  cd "suda.vim-$pkgver"
  find autoload doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
