# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Atte Lautanala <atte@lautana.la>

_name=auto-session
pkgname=neovim-auto-session
pkgver=2.5.1
pkgrel=1
pkgdesc="A small automated session manager for Neovim"
arch=('any')
url="https://github.com/rmagatti/$_name"
license=('MIT')
groups=('neovim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('33f97b3cbed8a17ecb7a3d82f2dcd9b7861d20cbfff83b9200e98fa436a49d86cd59abda449eff67d5307be7a0e8b3d9a4275b363c3066a28008a80958e46f3a')

package() {
    depends=('neovim')
    cd "$_name-$pkgver"

    find doc lua -type f -exec \
        install -Dm0644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/auto-session/{}" \;
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
