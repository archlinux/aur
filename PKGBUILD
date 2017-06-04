# Maintainer: Marco Pompili <aur (at) emarcs (dot) org>

_npmname=lerna
_npmver=2.0.0-rc.5
pkgname=lerna # All lowercase
pkgver=2.0.0rc.5
pkgrel=1
pkgdesc="Tool for managing JavaScript projects with multiple packages"
arch=(any)
url="https://github.com/sebmck/lerna#readme"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_npmname}/${_npmname}/archive/v${_npmver}.tar.gz")
sha256sums=('97d06eada84e4ac53832e6e16ffe2ad5e8c67eb362fcb4d6b6ddfbcc85c78316')
noextract=(${_npmname}-${_npmver}.tgz)

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
