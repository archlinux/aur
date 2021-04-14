# Maintainer: lmartinez-mirror
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=vim-ctrlp-git
pkgver=1.81.r0.g971c4d4
pkgrel=1
pkgdesc='Full path fuzzy file, buffer, mru, tag, ... finder'
arch=('any')
url='https://github.com/ctrlpvim/ctrlp.vim'
license=('custom:vim')
depends=('vim-plugin-runtime')
makedepends=('git')
groups=('vim-plugins')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 readme.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set et sw=2 ts=2 tw=79:
