# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nvim-treesitter
pkgname=neovim-nvim-treesitter
pkgver=0.8.5.2
pkgrel=1
pkgdesc="Nvim Treesitter configurations and abstraction layer"
arch=(any)
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=(Apache)
groups=(neovim-plugins)
depends=(curl gcc neovim tar)
install=$pkgname.install
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('411d15176173156eb911427a8ad5ed6b6b6f592f526d28f77a3ff2e1d940e6b5f3ef8c63a6d08a3d63596e402ad383af59407911b38c57186024831367d9e435')
b2sums=('b3e9ca4a7efbf449822933a9e7baeb21600686af7bcf47a95a7d9d900bdd5fc3d3909a98b9cd5ad5ae79a0f6ee4b353c2a5c655b108d66690d85e3b5fecfd4e6')

package() {
  local dirs=(autoload doc lua plugin queries)

  cd $_name-$pkgver
  find "${dirs[@]}" -type f -exec install -vDm 644 {} "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/{}" \;
  install -vdm 755 "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/parser"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
