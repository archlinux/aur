# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-workspace-git
pkgver=1.8.3.r18.gfaa8354
pkgrel=1
pkgdesc="Vim workspace manager plugin for managing groups of files"
arch=('any')
url="https://github.com/thaerkh/vim-workspace"
license=('Apache')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find doc plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
