# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Author: cscs <admin[at]cscs[dot]tech>
pkgname=refremir-git
pkgver=r13.81076b6
pkgrel=1
pkgdesc="Script for sourcing, ranking, and sorting mirrors into mirrorlists"
arch=('any')
url="https://gitlab.com/cscs/refremir"
license=('GPL')
source=("git+$url.git")
depends=('rate-mirrors')
optdepends=('reflector: alternative ranking backend')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${pkgname%-git}" || exit 1

  install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
