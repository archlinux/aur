# Collaborator: icasdri <icasdri at gmail dot com>
# Maintainer: knight42 <anonymousknight96 at gmail dot com>

_npmname=create-react-app
pkgname="nodejs-${_npmname}"
pkgver=1.5.2
pkgrel=1
pkgdesc="Create React apps with no build configuration"
arch=(any)
url="https://www.npmjs.com/package/${_npmname}"
license=('BSD')
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=(${_npmname}-${pkgver}.tgz)
sha384sums=('ebb884563b86f66ff7d93dd857acd9e167a874727d5f6f19c0e4d893774f3e79e7d847bba1b054e1d72489b59035762b')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
