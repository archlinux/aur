# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-wiki
pkgver=0.1
pkgrel=1
pkgdesc="A wiki plugin for Vim"
arch=('any')
url="https://github.com/lervag/wiki.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-wiki-ft: Wiki filetype plugin')
provides=('vim-ctrlp-wiki' 'vim-coc-wiki' 'vim-unite-wiki')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c709acf7b2c3b834c39cf496a5a6a1ee908b125e6a3419968d013ee9b9a0c963')

package() {
  cd "wiki.vim-$pkgver"
  find autoload doc plugin pythonx rplugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
