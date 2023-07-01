# Maintainer: ArcanusNEO <admin@transcliff.top>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: librewish
pkgname=whitesur-kvantum-theme-git
_gitname=WhiteSur-kde
pkgver=r110.248d4c0
pkgrel=1
pkgdesc="WhiteSur theme for Kvantum"
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
depends=('kvantum-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
  'whitesur-kde-theme'
  'whitesur-kde-theme-git'
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/share"
  cp -r Kvantum "$pkgdir/usr/share"
}
