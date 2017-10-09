# Maintainer: Marco Pompili <aur (at) emarcs (dot) org>

_npmname=lerna
_npmver=2.4.0
pkgname=lerna # All lowercase
pkgver=2.4.0
pkgrel=1
pkgdesc="Tool for managing JavaScript projects with multiple packages"
arch=(any)
url="https://github.com/sebmck/lerna#readme"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_npmname}/${_npmname}/archive/v${_npmver}.tar.gz")
sha256sums=('97a740947c0d86474b9329de7b8faa8328ef130b076477ff7e873522111533a2')
noextract=(${_npmname}-${_npmver}.tgz)

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
