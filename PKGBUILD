# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-orgmode
_pkg="${pkgname#neovim-}"
pkgver=0.7.1
pkgrel=1
pkgdesc="Orgmode clone for Neovim"
arch=('any')
url="https://github.com/kristijanhusak/orgmode.nvim"
license=('MIT')
groups=('neovim-plugins')
install=orgmode.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('04a732d6c882732282a4c18ee9b6873ef8b67358d7c1ff73e4583812777e23cf')

package() {
    depends=('neovim')
    cd "$_pkg-$pkgver"
    dirs=(doc ftplugin indent lua queries syntax)
    find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
