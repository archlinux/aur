# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nvim-treesitter
pkgname=neovim-nvim-treesitter
pkgver=0.9.0
pkgrel=1
pkgdesc="Nvim Treesitter configurations and abstraction layer"
arch=(any)
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=(Apache)
groups=(neovim-plugins)
depends=(
  curl
  gcc
  neovim
  tar
)
install=$pkgname.install
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('8375289ed78ef8083d52ecb84ea34482dea7b1b9e716c74aa35fd21f87272d5434a84fff78c4a926b000f66e730c1bf58bf5ddf4e5ed2afd038a2cb00cbde04c')
b2sums=('a459ee4d4a6596fa67a9ab05c097ada1bd64b54ade612d9c8304f26b1511e0a195164056ef89af5e989ce9ebfa4aea52bc183974008ef65e86a7cd91db759c13')

package() {
  local dirs=(autoload doc lua plugin queries)

  cd $_name-$pkgver
  find "${dirs[@]}" -type f -exec install -vDm 644 {} "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/{}" \;
  install -vdm 755 "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/parser"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
