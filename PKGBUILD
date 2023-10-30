# Maintainer: ArcanusNEO <admin@transcliff.eu.org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: librewish
pkgname=kvantum-theme-whitesur-git
_gitname=WhiteSur-kde
pkgver=r114.2b4bcc7
pkgrel=1
pkgdesc="WhiteSur theme for Kvantum"
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
depends=('kvantum')
makedepends=('git')
provides=(
  "${pkgname%-git}"
  'whitesur-kvantum-theme'
)
conflicts=(
  "${pkgname%-git}"
  'whitesur-kvantum-theme'
  'plasma5-themes-whitesur'
  'whitesur-kde-theme'
)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/share"
  cp -r Kvantum "$pkgdir/usr/share"
}
