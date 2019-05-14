# Maintainer: 01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>
_npmname=live-server
_npmver=1.2.1
pkgname="nodejs-${_npmname}"
pkgver="${_npmver}"
pkgrel=1
pkgdesc="A simple development HTTP server with live reload capability"
arch=('any')
url="https://github.com/tapio/live-server"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=('b55db556232443fbbafa67adb57f06e1009e2d7a49e512fecd03c8639f97cd33')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}
