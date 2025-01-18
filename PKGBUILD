# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=nottoomuch-addresses-git
pkgver=r45.fdfe30e
pkgrel=1
pkgdesc='An email address completion/matching tool'
arch=('any')
url='https://github.com/domo141/nottoomuch/blob/master/nottoomuch-addresses.rst'
license=('BSD-2-Clause')
depends=('notmuch')
makedepends=('git')
source=("git+https://github.com/domo141/${pkgname%-addresses-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-addresses-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${pkgname%-addresses-git}/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}.sh"
}
