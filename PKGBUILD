# Maintainer: Chuan Ji <chuan@jichu4n.com>

_pkgname=palm-os-sdk
pkgname=palm-os-sdk-git
pkgver=r16.1fa2206
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
  cd "${srcdir}/palm-os-sdk"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/palm-os-sdk"
  install -d "${pkgdir}/opt/palmdev"
  cp -dr --no-preserve=ownership * "${pkgdir}/opt/palmdev/"
}

# vim:set ts=2 sw=2 et:
