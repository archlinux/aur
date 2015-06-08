# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
_npmname=wordwrap
pkgname=nodejs-${_npmname}
pkgver=0.0.2
pkgrel=2
pkgdesc='Light-weight option parsing with an argv hash. No optstrings attached.'
arch=(any)
url='https://github.com/substack/node-wordwrap'
license=(MIT)
depends=('nodejs')
source=(http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz)
noextract=(${_npmname}-${pkgver}.tgz)
md5sums=('337b01f9fc79d9fbe9981ce70ad34d6f')

package() {
  cd $srcdir
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${pkgver}
}

