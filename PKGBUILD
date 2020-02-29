# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Based on cura-binary-data by: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura-binary-data-git
_pkgname=cura-binary-data
pkgver=4.5.0
pkgrel=1
pkgdesc="Binary data (firmwares) for cura"
depends=()
makedepends=('git')
url="https://github.com/Ultimaker/${pkgname}"
license=('AGPLv3')
arch=('any')
#options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
source=('git+https://github.com/Ultimaker/cura-binary-data.git')
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/-/./g'
}

package(){
  mkdir -p "${pkgdir}/usr/share/cura/resources/"
  cp -r "${srcdir}/${_pkgname}/cura/resources/firmware" "${pkgdir}/usr/share/cura/resources/"
}


