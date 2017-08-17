# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_npmname=testee
_npmver=0.7.0
pkgname="nodejs-${_npmname}"
pkgver="${_npmver}"
pkgrel=1
pkgdesc="Run your QUnit, Mocha or Jasmine tests from the command line with any browser"
arch=('any')
url="https://github.com/bitovi/testee/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=('phantomjs: Headless WebKit JavaScript API, used as default browser')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha1sums=('15b576545fda6fa9b92262989716eaab083f54c9')

package() {
  cd "${srcdir}"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}

# vim:set ts=2 sw=2 cc=80 et:
