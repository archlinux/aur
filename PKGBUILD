# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Author: cscs <admin[at]cscs[dot]tech>
# Contributor: Patrick Brisbin <pbrisbin@gmail.com>
pkgname=cachyos-downgrade-git
pkgver=r8.4f661a9
pkgrel=1
pkgdesc="Script for downgrading one or more packages to a version in your cache or the C.L.A. or A.L.A."
arch=('any')
url="https://gitlab.com/cscs/cachyos-downgrade"
license=('GPL')
source=("git+$url.git")
depends=('downgrade') # pacman-contrib fzf ## pacsort
optdepends=('sudo: for installation via sudo')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${pkgname%-git}" || exit 1

  install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
