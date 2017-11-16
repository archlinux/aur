# Maintainer: Marco Pompili <aur (at) emarcs (dot) org>

_npmname=lerna
_npmver=2.5.1
pkgname=lerna # All lowercase
pkgver=2.5.1
pkgrel=1
pkgdesc="Tool for managing JavaScript projects with multiple packages"
arch=(any)
url="https://github.com/sebmck/lerna#readme"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_npmname}/${_npmname}/archive/v${_npmver}.tar.gz")
sha256sums=('4313420a415f28f1d88c2460b9dc7ddf5de7a38665abbcf8966c5e6d2b33bf95')
noextract=(${_npmname}-${_npmver}.tgz)

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
