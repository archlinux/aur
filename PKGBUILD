# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-splitjoin
pkgver=1.0.0
pkgrel=1
pkgdesc="Vim plugin for switching between single-line and multi-line forms of code"
arch=('any')
url="https://github.com/andrewradev/splitjoin.vim"
license=('MIT')
groups=('vim-plugins')
depends=('ruby' 'vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7cfeaccb92ea77f2c589553b0987e34b4644096554fb94da658c5adcec4d191d')

package() {
  cd "splitjoin.vim-$pkgver"
  find autoload doc ftplugin plugin spec \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
