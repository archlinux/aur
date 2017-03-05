_npmname=lerna
_npmver=2.0.0-beta.38
pkgname=lerna # All lowercase
pkgver=2.0.0beta.38
pkgrel=1
pkgdesc="Tool for managing JavaScript projects with multiple packages"
arch=(any)
url="https://github.com/sebmck/lerna#readme"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_npmname}/${_npmname}/archive/v${_npmver}.tar.gz")
noextract=(${_npmname}-${_npmver}.tgz)
sha1sums=('734c30f16a0b2c111c2983f3aaaf1179d11905a4')

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
