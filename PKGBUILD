# Maintainer: Tim Savannah <kata198@gmail.com>

_basename=pacman-utils

pkgname=pacman-utils-data
_basever="0.5.1"
date_str=2017_06_03
pkgver="${_basever}__${date_str}"
pkgrel=1
pkgdesc="Additional data for use with pacman-utils (required for provides_upstream)"
# arch package url is https://github.com/kata198/pacman-utils-data-pkg
url="https://github.com/kata198/pacman-utils"
arch=(i686 x86_64)
license=(apache)
depends=(pacman-utils)
source=("https://github.com/kata198/pacman-utils/archive/${_basever}.tar.gz")
md5sums=('020375e8130ae5a73c721e9194ca9142')

build() {
  cd "${_basename}-${_basever}"

}

package() {
  mkdir -p "${pkgdir}/var/lib/pacman"

  pushd "${srcdir}/${_basename}-${_basever}"

  ./install_data.sh DESTDIR="${pkgdir}"

  popd
}
