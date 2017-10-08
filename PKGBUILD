# Maintainer: Wynne Plaga <rwplaga.linux@gmail.com>
_pkgname=capitaine-cursors
pkgname=la-capitaine-cursor-theme
pkgver=r24.fbb3887
pkgrel=1
pkgdesc="The La Capitaine x-cursor theme "
arch=('any')
url="https://github.com/keeferrourke/capitaine-cursors"
license=('LGPL3')
source=('git+https://github.com/keeferrourke/capitaine-cursors.git')
makedepends=('git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  mkdir -p "${pkgdir}/usr/share/icons/capitaine-cursors1"
  cp -r dist/* "${pkgdir}/usr/share/icons/capitaine-cursors1"
}
