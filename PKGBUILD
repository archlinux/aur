# Maintainer: 00ein00
# Contributor: Brijesh <brijeshsundi@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=spotx-git
pkgver=r216+ge0d76eef9
pkgrel=1
pkgdesc="SpotX Bash Script | Block all audio, banner & video ads | Block logging"
arch=('any')
url="https://github.com/SpotX-Official/SpotX-Bash"
license=('MIT')
depends=(perl zip unzip)
makedepends=('git')
provides=(spotx)
conflicts=(spotx)
source=("${pkgname}::git+https://github.com/SpotX-Official/SpotX-Bash.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s+g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 spotx.sh "${pkgdir}/usr/bin/spotx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
