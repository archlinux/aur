# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-orgmode
_pkg="${pkgname#neovim-}"
pkgver=0.7.5
pkgrel=1
pkgdesc="Orgmode clone for Neovim"
arch=(any)
url="https://github.com/kristijanhusak/orgmode.nvim"
license=(MIT)
groups=(neovim-plugins)
install=orgmode.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2bcdd334a979a58311f2001798ac153089f71227ded27fe830f5289590d3d6e6')

package() {
    depends=(neovim)
    cd "$_pkg-$pkgver"
    dirs=(doc ftplugin indent lsp lua queries syntax)
    find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
