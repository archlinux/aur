_npmname=lerna
_npmver=2.0.0-rc.1
pkgname=lerna # All lowercase
pkgver=2.0.0rc.1
pkgrel=1
pkgdesc="Tool for managing JavaScript projects with multiple packages"
arch=(any)
url="https://github.com/sebmck/lerna#readme"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_npmname}/${_npmname}/archive/v${_npmver}.tar.gz")
noextract=(${_npmname}-${_npmver}.tgz)
sha256sums=('6eb58cf45c132bb384f6f2cf566a345f3681a63ece6e702f5795dc79e131b2a1')

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
