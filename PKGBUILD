# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-quickui
pkgver=1.5.6
pkgrel=1
pkgdesc="Vim plugin that displays a user-configurable menu bar"
arch=('any')
url="https://github.com/skywind3000/vim-quickui"
license=('MIT')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b368d472851f84db45efd04ce34ee0786d57c3d719b2ab9838a249a190e2e69e')

package() {
    depends=('vim-plugin-runtime')
    cd "$pkgname-$pkgver"
    find autoload colors lua plugin \
        -type f \
        -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 AGENTS.md CLAUDE.md README.md MANUAL.md \
        -t "$pkgdir/usr/share/doc/$pkgname/"
}
