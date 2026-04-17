# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Author: cscs <admin[at]cscs[dot]tech>
pkgname=pastelo-git
pkgver=r35.eae8bb5
pkgrel=1
pkgdesc="Script to leverage various pastebin services like dpaste or 0x0.st"
arch=('any')
url="https://gitlab.com/cscs/pastelo"
license=('GPL')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${pkgname%-git}" || exit 1

  install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
