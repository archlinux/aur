# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=vim-sneak
pkgver=1.9
pkgrel=1
pkgdesc='Motion plugin for Vim'
arch=('any')
url='https://github.com/justinmk/vim-sneak'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('26a8cded35a91b3cd8f680d2fe966a6c615a27027590f7425e11e8d39605e549')

PURGE_TARGETS=('.gitignore')

package() {
  cd "$pkgname-$pkgver"
  find autoload doc plugin -type f -exec install -Dm 644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set et sw=2 ts=2 tw=79:
