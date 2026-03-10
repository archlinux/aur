# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-splitjoin
pkgver=1.2.0
pkgrel=1
pkgdesc="Vim plugin for switching between single-line and multi-line forms of code"
arch=('any')
url="https://github.com/andrewradev/splitjoin.vim"
license=('MIT')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0882d4e23ba0f2d13e83a98f8f5b625ce72017088932a89dfa281bac59fca4d3')

package() {
    depends=('ruby' 'vim-plugin-runtime')
    cd "splitjoin.vim-$pkgver"
    find autoload doc ftplugin plugin spec \
      -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
