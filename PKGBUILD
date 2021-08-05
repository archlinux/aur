# Maintainer: ebiadsu <ebiadsu at posteo dot de>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_npmname=browser-sync
_npmver=2.27.5
pkgname="nodejs-${_npmname}"
pkgver="${_npmver}"
pkgrel=1
pkgdesc="Live CSS Reload & Browser Syncing"
arch=('any')
url="https://www.browsersync.io/"
license=('Apache')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
sha256sums=('880f3ebcdb22e2be89e11bc1cc8c4f77b2cfa438c0abbba1ae8a12d72b70e035')
noextract=("${_npmname}-${_npmver}.tgz")

package() {
  cd "${srcdir}"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}

# vim:set ts=2 sw=2 cc=80 et:
