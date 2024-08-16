# Maintainer: detiam <dehe underline tian at outlook dot com>
# Contributor: Sebastian Wolf <swolf at melonkru dot de>

_pkgname=xseticon
pkgname="$_pkgname-detiam"
pkgver=0.1+bzr14
pkgrel=1
pkgdesc="Set the X11 window icon for any given window to that of a given image file"
arch=('i686' 'x86_64')
url="https://github.com/detiam/${_pkgname}"
depends=('libx11' 'libxmu' 'gd' 'imagemagick')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('GPL-2.0-or-later')
source=("git+${url}#tag=${pkgver}")
sha256sums=('6ed8b8c1e75c03425e5a4d55c978bc10e49e72de012afeb28a3083f0b5290290')

build() {
  cd "${srcdir}/${_pkgname}"
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 ${_pkgname} "${pkgdir}/usr/bin/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
