# Maintainer: Christopher KOBAYASHI <software plus aur at disavowed dot jp>

pkgname="dahdi-linux-ck-git-dkms"
pkgdesc="DAHDI drivers for Asterisk, patched to support older cards"
pkgver=20220326.g9b3d416
pkgrel=2
arch=('any')
url="http://www.asterisk.org/"
license=("LGPLv2")
depends=('dkms')
makedepends=("linux-headers")
conflicts=("dahdi")
source=("git+https://github.com/christopherkobayashi/dahdi-linux.git")

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/dahdi-linux"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

package() {
  cd "${srcdir}"
  local install_dir="${pkgdir}/usr/src/dahdi-linux-${pkgver}"

  # Copy sources
  mkdir -p "${install_dir}"
  cp -r "${srcdir}"/dahdi-linux/* "${install_dir}"/
}
