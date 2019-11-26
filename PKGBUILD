# Maintainer: Parker Reed <parker.l.reed@gmail.com>

_pkgbase=new-lg4ff
pkgname=new-lg4ff-dkms-git
pkgver=r27.3dfe622
pkgrel=1
pkgdesc="Experimental Logitech force feedback module (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/berarma/new-lg4ff"
license=('GPL2')
depends=('dkms')
conflicts=("${pkgname}")
install=${pkgname}.install
source=("git+https://github.com/berarma/new-lg4ff")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgbase}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}"/usr/src/${_pkgbase}/

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}/
}
