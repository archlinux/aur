# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>

_npmname=adonis-cli
_npmver=2.1.9
pkgname=nodejs-adonis-cli # Must be all lower-case
pkgver=2.1.9
pkgrel=1
pkgdesc="Adonis CLI module to generate new Adonis JS application"
arch=(any)
url="https://github.com/adonisjs/adonis-cli"
license=(MIT)
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=('5a0771c94726fe171904a0fdb3db15176814b8b9be0d138b31d21e70d5ed6c8a')

package() {
  cd "${srcidir}"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}

# vim:set ts=2 sw=2 et:
