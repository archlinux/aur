# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-dim
pkgver=1.1.0
pkgrel=1
pkgdesc="Default IMproved -- An improvement of Vim's default colorscheme"
arch=('any')
url="https://github.com/jeffkreeftmeijer/vim-dim"
license=('unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c135506f1300f8738ba79cad8c35d963ede9f8e82ba64ec7305a7a53a0691a97')

package() {
  cd "$pkgname-$pkgver"
  find colors \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
