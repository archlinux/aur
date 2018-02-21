# Maintainer: Marcs <aur (at) mg.odd.red>

_npmname=lerna
_npmver=2.9.0
pkgname=lerna # All lowercase
pkgver=2.9.0
pkgrel=1
pkgdesc="Tool for managing JavaScript projects with multiple packages"
arch=(any)
url="https://github.com/sebmck/lerna#readme"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_npmname}/${_npmname}/archive/v${_npmver}.tar.gz")
sha256sums=('fe73fa42493e9bc0e6a6f39dd57ef5d890c008e5e92ae2acfb70706adad7b4e1')
noextract=(${_npmname}-${_npmver}.tgz)

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
