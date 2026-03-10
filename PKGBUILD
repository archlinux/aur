# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-quickui
pkgver=1.4.7
pkgrel=1
pkgdesc="Vim plugin that displays a user-configurable menu bar"
arch=('any')
url="https://github.com/skywind3000/vim-quickui"
license=('MIT')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bc8f9c2570f4ddf30818f3f136a4f6823ea700b083df56ad7f4e4015d83e6e4f')

package() {
    depends=('vim-plugin-runtime')
    cd "$pkgname-$pkgver"
    find autoload colors plugin \
        -type f \
        -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md MANUAL.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
