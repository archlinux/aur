# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nvim-treesitter
pkgname=neovim-nvim-treesitter
pkgver=0.8.3
pkgrel=1
pkgdesc="Nvim Treesitter configurations and abstraction layer"
arch=(any)
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=(Apache)
groups=(neovim-plugins)
depends=(curl gcc neovim tar)
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('b47f39ed3fe71e43b591c8d0a6c25bf14718e20b7f38788e130dd0e2dc25e76f73043e9889e125b7ea315702e69b25c757be6b6adc5ccbb1febcde0ebe9cc4f9')
b2sums=('b7a26e426d375400578b644465eed1120182458f466db03ee665fcde5df1d6fd6ad6b1a0f1389b51cf7a2f5177810850a4ce7d13eec3abdc4b6f89310ca874af')

package() {
  local dirs=(autoload doc lua plugin queries)
  cd $_name-$pkgver
  find "${dirs[@]}" -type f -exec install -vDm 644 {} "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/{}" \;
  install -vdm 755 "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/parser"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
