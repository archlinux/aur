# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-startuptime
pkgver=4.5.0
pkgrel=1
pkgdesc="Vim plugin for profiling startup time"
arch=('any')
url="https://github.com/dstein64/vim-startuptime"
license=('MIT')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c30fbe2a0b23460fe6fb6939e16f23dc5388eecb4d690d8d859babe37ef71ba2')

PURGE_TARGETS=('tags')

package() {
    depends=('vim-plugin-runtime')

    cd "$pkgname-$pkgver"
    find autoload doc lua plugin -type f \
        -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
