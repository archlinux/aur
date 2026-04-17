# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Author: cscs <admin[at]cscs[dot]tech>
pkgname=sera-git
pkgver=r20.b1f5060
pkgrel=1
pkgdesc="Command-line updater for KDE Plasma addons, widgets, plasmoids, or plugins."
arch=('any')
url="https://gitlab.com/cscs/sera"
license=('MIT')
source=("git+$url.git")
depends=('jq')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${pkgname%-git}" || exit 1

  install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
