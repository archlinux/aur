# Maintainer: Xyne (ca dot archlinux at xyne, backwards)

pkgname=vim-gutentag-git
pkgver=r101.de24085
pkgrel=1
pkgdesc='Tag management and viewing plugin.'
url='https://github.com/mpevnev/guten-tag'
arch=('any')
license=('custom:vim')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname::git+https://github.com/mpevnev/guten-tag.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  _installpath="$pkgdir/usr/share/vim/vimfiles"
  find . -type f -name '*.vim' -exec install -Dm644 '{}' "$_installpath"/'{}' \;
  install -Dm 644 license.txt -t "$pkgdir/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
