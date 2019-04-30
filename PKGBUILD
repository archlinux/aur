# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>

pkgname=nodejs-adonis-cli
pkgver=4.0.12
pkgrel=1
pkgdesc="Adonis CLI module to generate new Adonis JS application"
arch=(any)
url="https://github.com/adonisjs/adonis-cli"
license=(MIT)
makedepends=('npm')
_npmname=@adonisjs/cli
_npmver="${pkgver}"
_fullpkg="${_npmname}-${_npmver}"
source=("https://registry.npmjs.org/${_npmname}/-/${_fullpkg}.tgz")
noextract=("${_fullpkg}.tgz")
sha256sums=('29826e672efe45bbfcadf7821b47f8cebd1f074ffeb500f89ede137822746224')

package() {
  cd "${srcdir}"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  rm -rf "${_npmdir}"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}

# vim:set ts=2 sw=2 et:
