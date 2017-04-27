# Maintainer: Marco Pompili <aur (at) emarcs (dot) org>

_npmname=lerna
_npmver=2.0.0-rc.4
pkgname=lerna # All lowercase
pkgver=2.0.0rc.4
pkgrel=1
pkgdesc="Tool for managing JavaScript projects with multiple packages"
arch=(any)
url="https://github.com/sebmck/lerna#readme"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_npmname}/${_npmname}/archive/v${_npmver}.tar.gz")
noextract=(${_npmname}-${_npmver}.tgz)
sha256sums=('b34a81fe4434a35b7d378a4eedbf975854aa54e50158ca63e4e5d11fa0fbef7b')

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
