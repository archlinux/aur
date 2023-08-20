# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nvim-treesitter
pkgname=neovim-nvim-treesitter
pkgver=0.9.1
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
sha512sums=('100e6ea0602167881aad94870ac212f9dd96fec0a1f4896d0ccc653f8f624d79ec128c056df64a389d6efd7172813d3e1071854c567e6fba9bbe9b0463bc7a33')
b2sums=('9d65a9e7a38503b8db5f3b3d706a15691736930d101e091dc7166ff9e2d1d5b0b87fb5fedcb3e3fa9772e45af7db8d1e07af49da18575a98c217f6076a2d6590')

package() {
  local dirs=(autoload doc lua plugin queries)

  cd $_name-$pkgver
  find "${dirs[@]}" -type f -exec install -vDm 644 {} "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/{}" \;
  install -vdm 755 "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/parser"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
