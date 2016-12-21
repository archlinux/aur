# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_npmname=browser-sync
_npmver=2.18.5
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Live CSS Reload & Browser Syncing"
arch=('any')
url="https://www.browsersync.io/"
license=('Apache')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=('${_npmname}-${_npmver}.tgz')
sha1sums=('c04b10037289df5157a363d42100069d77e744e9')

package() {
  cd "${srcdir}"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install --user root -g --prefix "${pkgdir}/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 cc=80 et:
