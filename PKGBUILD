# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=nottoomuch-addresses-git
pkgver=r45.fdfe30e
pkgrel=1
pkgdesc='An email address completion/matching tool'
arch=('any')
url="http://www.guru-group.fi/~too/nottoomuch/nottoomuch-addresses/"
license=('GPL')
depends=('notmuch')
source=("git+https://github.com/domo141/${pkgname%-addresses-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-addresses-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${pkgname%-addresses-git}/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}.sh"
}
