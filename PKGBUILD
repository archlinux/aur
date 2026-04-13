# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=lsp_signature
pkgname=neovim-lsp_signature
pkgver=0.3.1
pkgrel=1
pkgdesc="LSP signature hint as you type"
arch=('any')
url="https://github.com/ray-x/lsp_signature.nvim/"
license=('Apache-2.0')
groups=('neovim-plugins')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('11ac220b7014b525b778eb7c7aae8f749c0836f2b88da681fcef69ee0c402c333968dd89cb67a89d5b6fbbd284b42fab6d04e38115167f182990736b38fbfe59')
b2sums=('50928dcd4b22f18cf6943f92b72ca707df0323e92ee23af09d4322d8777114e8fde0b92e366bcc5475a4bc92161b4af88b96d44fa0d43abbc3b403d93d770a34')

package() {
    depends=('luajit' 'neovim')
    cd "lsp_signature.nvim-$pkgver"
    find doc lua -type f -exec install -vDm 644 {} "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/{}" \;
    install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
