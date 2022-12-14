# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nvim-treesitter
pkgname=neovim-nvim-treesitter
pkgver=0.8.1
pkgrel=1
pkgdesc="Nvim Treesitter configurations and abstraction layer"
arch=(any)
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=(Apache)
groups=(neovim-plugins)
depends=(curl gcc neovim tar)
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('681656d09ac99e25de7abf8e68a679196d09a21859686e225c37d5994c9d1cff67d3c172b28aa69749e9516d77bfe0dc8134f9b34c010948c940fbadbded924f')
b2sums=('67a79e857fa3041a6b159b3203781e42abc57d8757fb26714cffbfe8e14db2bba2373365bd709f45b7ea35f938e55e58e66dc94ece153a839cadb55bd69b6028')

package() {
  local dirs=(autoload doc lua plugin queries)
  cd $_name-$pkgver
  find "${dirs[@]}" -type f -exec install -vDm 644 {} "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/{}" \;
  install -vdm 755 "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/parser"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
