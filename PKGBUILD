# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-quick-scope
pkgver=2.7.1
pkgrel=1
pkgdesc="Always-on highlight for fast left-right movement between words"
arch=('any')
url="https://github.com/unblevable/quick-scope"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('15758f54d894090daa512acb594fac4f10ccc445d811e4babc02ab628d6be90e')
validpgpkeys=(
    '7E5E9FB83B0871E709F1EBA0896BA880CBBF2C53' ## Bradford Smith
    'E96D8B601BE35D08567314805C112E8DE408E502' ## Oliver Harley
    '8C383C26D7A884B9098E0D5338C7564724AB8709' ## "Bannerets"
)

package() {
    depends=('vim-plugin-runtime')
    cd "$pkgname"
    find autoload doc plugin \
        -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
