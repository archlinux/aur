# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-wiki
pkgver=0.12
pkgrel=1
pkgdesc='A wiki plugin for Vim'
arch=('any')
url='https://github.com/lervag/wiki.vim'
license=('MIT')
groups=('vim-plugins')
depends=('python' 'vim-plugin-runtime')
optdepends=('vim-wiki-ft: Wiki filetype plugin'
            'pandoc: WikiExport support')
provides=('vim-ctrlp-wiki' 'vim-coc-wiki' 'vim-unite-wiki')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f28a002a5590cbb4d0eed2e35edfd919f571aca443425a0fd06d78b08c8fb421')

package() {
  local dirs=(autoload doc plugin pythonx)
  cd "wiki.vim-$pkgver"
  find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
