# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-asyncrun
pkgver=2.13.4
pkgrel=1
pkgdesc="Vim plugin for executing shell commands asynchronously"
arch=('any')
url="https://github.com/skywind3000/asyncrun.vim"
license=('MIT')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f6060c25217d784e0ddd4c49fe0cbdc21ced5c5bc9563d447a31750a4ce6ea33')

package() {
    depends=('vim-plugin-runtime')
    local dirs=(autoload plugin lua)
    cd "asyncrun.vim-$pkgver"
    find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dvm644 doc/asyncrun.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm644 README*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
