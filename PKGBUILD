# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-wiki
pkgver=0.4
pkgrel=2
pkgdesc="A wiki plugin for Vim"
arch=('any')
url="https://github.com/lervag/wiki.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-wiki-ft: Wiki filetype plugin'
            'pandoc: WikiExport support')
provides=('vim-ctrlp-wiki' 'vim-coc-wiki' 'vim-unite-wiki')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('673c90ca0928081ce67fe240a94ce9ee0849b013e1af50c25b95bc8f1fa9294a')

package() {
  cd "wiki.vim-$pkgver"
  find autoload doc plugin pythonx rplugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
