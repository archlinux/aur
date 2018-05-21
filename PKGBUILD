# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>

_npmname=@adonisjs/cli
_npmver=4.0.11
pkgname=nodejs-adonis-cli # Must be all lower-case
pkgver=4.0.11
pkgrel=1
pkgdesc="Adonis CLI module to generate new Adonis JS application"
arch=(any)
url="https://github.com/adonisjs/adonis-cli"
license=(MIT)
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=('ca8f66b7501d507dd1d52272c7b8041619666cfae44e7685f4f5e0db1e28fe85')

package() {
  cd "${srcdir}"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  rm -rf "${_npmdir}"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}

# vim:set ts=2 sw=2 et:
