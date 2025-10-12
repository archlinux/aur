# Maintainer: Simon Hafner <hafnersimon@gmail.com>

pkgname=kwin6-grayscale-effect-git
_pkgname=kwin-grayscale-effect
pkgver=r52.624a666
pkgrel=2
pkgdesc="KWin grayscale effect for Plasma 6 (VCS package tracking the plasma6 branch)"
arch=('any')
url="https://github.com/lliurex/${_pkgname}"
license=('GPL3')
depends=('kwin')
makedepends=('git')
provides=('kwin6-grayscale-effect')
conflicts=('kwin6-grayscale-effect')
source=("${_pkgname}::git+https://github.com/lliurex/${_pkgname}.git#branch=plasma6")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d "${pkgdir}/usr/share/kwin/effects/"
  # Install only the Plasma 6 effect directory
  cp -a "kwin6_effect_grayscale" "${pkgdir}/usr/share/kwin/effects/"
}
