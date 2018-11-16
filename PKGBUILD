# Maintainer: ebiadsu <ebiadsu at posteo dot de>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_npmname=browser-sync
_npmver=2.26.3
pkgname="nodejs-${_npmname}"
pkgver="${_npmver}"
pkgrel=1
pkgdesc="Live CSS Reload & Browser Syncing"
arch=('any')
url="https://www.browsersync.io/"
license=('Apache')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
sha1sums=('1b59bd5935938a5b0fa73b3d78ef1050bd2bf912')
noextract=("${_npmname}-${_npmver}.tgz")

package() {
  cd "${srcdir}"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}

# vim:set ts=2 sw=2 cc=80 et:
