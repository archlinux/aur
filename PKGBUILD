# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nvim-treesitter
pkgname=neovim-nvim-treesitter
pkgver=0.9.2
pkgrel=1
pkgdesc="Nvim Treesitter configurations and abstraction layer"
arch=(any)
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=(Apache-2.0)
groups=(neovim-plugins)
depends=(
  curl
  gcc
  neovim
  tar
)
install=$pkgname.install
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('f772c62d12e2b8299e33e6f8f4977b742e3e425585013bdc31a61d5e619fc697b4aba8b304e84124f59a5762ce4c416129328433aaf689ee1fc0f7f2d8a75a1d')
b2sums=('4b74a8832898047c5de7b8f580fcca33f36ad95866825f2ba7fd1e06c4127ac6e235dc862952ed0a791e986337b79ac4f9ce41d9a0bbb4d2f52c07b849838306')

package() {
  local dirs=(autoload doc lua plugin queries)

  cd $_name-$pkgver
  find "${dirs[@]}" -type f -exec install -vDm 644 {} "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/{}" \;
  install -vdm 755 "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/parser"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
