# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-quickui
pkgver=1.3.2
pkgrel=1
pkgdesc="Vim plugin that displays a user-configurable menu bar"
arch=('any')
url="https://github.com/skywind3000/vim-quickui"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('247873362e7e2195fede86be7837165124e75074a1b8f4651532119f35a1c3e9')

package() {
  cd "$pkgname-$pkgver"
  find autoload colors plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md MANUAL.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
