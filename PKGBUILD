# Maintainer: Chuan Ji <chuan@jichu4n.com>

pkgname=palm-os-sdk-git
pkgver=r1.6958f76
pkgrel=1
pkgdesc='Palm OS SDK files'
arch=('any')
url='https://github.com/jichu4n/palm-os-sdk'
license=('unknown')
depends=()
makedepends=('git')
optdepends=(
  'prc-tools-remix: C/C++ toolchain for Palm OS'
  'pilrc: Palm OS resource compiler')
options=(!emptydirs !strip)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/palm-os-sdk"
  install -d "${pkgdir}/opt/palmdev"
  cp -dr --no-preserve=ownership * "${pkgdir}/opt/palmdev/"
}

# vim:set ts=2 sw=2 et:
