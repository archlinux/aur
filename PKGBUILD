# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
_pkgname="cover-thumbnailer"
pkgname="${_pkgname}-git"
pkgver=r57.760a344
pkgrel=1
pkgdesc="Generates thumbnails for Nautilus folders (music album covers,...)."
arch=('i686' 'x86_64')
url="https://github.com/flozz/cover-thumbnailer"
license=('GPL3')
depends=('python2-pillow' 'python2-gconf')
makedepends=('')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "${srcdir}/${_pkgname}"
    ./install.sh -p ${pkgdir}
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
