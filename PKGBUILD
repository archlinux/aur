# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-dim
pkgver=1.2.0
pkgrel=1
pkgdesc="Default IMproved -- An improvement of Vim's default colorscheme"
arch=('any')
url="https://github.com/jeffkreeftmeijer/vim-dim"
license=('LicenseRef-Unknown')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6ad9d76c7e57f22c90e94b860a99b567a155a565f9c0be48068530df4dbdd632')

package() {
    depends=('vim-plugin-runtime')
    cd "$pkgname-$pkgver"
    find colors \
      -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
